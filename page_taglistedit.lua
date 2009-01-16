module("taglistedit", package.seeall)
require("tester")
require("gui_stuff")
errorDialog = gui_stuff.errorDialog

muhkuh.include("taglist.lua", "taglist")
muhkuh.include("numedit.lua", "numedit")
muhkuh.include("stringedit.lua", "stringdit")
muhkuh.include("hexedit.lua", "hexedit")
muhkuh.include("hexdump.lua", "hexdump")
muhkuh.include("ipv4edit.lua", "ipv4edit")
muhkuh.include("macedit.lua", "macedit")
muhkuh.include("rcxveredit.lua", "rcxveredit")
muhkuh.include("structedit.lua", "structedit")
muhkuh.include("comboedit.lua", "comboedit")


-- public: createEditors, destroyEditors, getTagBin

--- the tag list
m_tagList = {}

--- list of page names/tags
m_pages = {}

--- current editor
m_editor = nil

--- current edit control
m_editCtrl = nil

--- the tag being edited
m_tag = nil

--- the parent window
m_parent = nil

--- the Treebook
m_book = nil

--- window ID of the treebook
m_bookId = nil

--- the scrolling panel inside the treebook
m_bookPanel = nil

--- the sizer for m_bookPanel
m_bookPanelSizer = nil

--- Event handler called when a page has been selected.
-- If a tag is currently displayed, the editor fields of
-- this tag are read back and checked. 
-- If the contents are valid, the values are stored in m_taglist,
-- and the page is cleared.
-- If there are errors on the current page, a message box 
-- is displayed and the pages are not switched.
local function OnPageChanging(event)
	local iOldPage = event:GetOldSelection()+1
	-- print("changing from page", iOldPage)
	
	if taglistedit.readbackPage() then
		taglistedit.clearPage()
	else
		event:Veto()
	end
end

--- Event handler called when a new page has been selected,
-- after calling OnPageChanging. This handler will show the 
-- editor for the new tag.
local function OnPageChanged(event)
	local iNewPage = event:GetSelection()+1
	-- print("changed to page", iNewPage)
	taglistedit.enterPage(iNewPage)
end

--- Given a list of tags, make a list of page titles and tags and 
-- create the book pages.
-- @param tagList a list of parameters and values. Each entry is a list with keys
-- strTagName (the name string in the rcx_mod_tags list) and abValue, the value
-- as binary data.
function createEditors(tagList)
	--print("creating editors, params=", tagList, "len=", #tagList)
	
	if not m_bookPanel then
		m_bookPanel = wx.wxScrolledWindow(m_book) 
		--m_bookPanel = wx.wxScrolledWindow(m_book, wx.wxID_ANY, 
		--wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxVSCROLL + wx.wxHSCROLL)
		m_bookPanel:SetScrollRate(32, 32)
		m_bookPanelSizer = wx.wxBoxSizer(wx.wxVERTICAL)
		m_bookPanel:SetSizer(m_bookPanelSizer)
		-- m_bookPanel:SetBackgroundColour(wx.wxGREEN)
	end
	
	m_tagList = tagList
	m_pages = {}
	for i, tTag in ipairs(tagList) do
		-- print(i, tTag)
		local strDesc = taglist.getTagDescString(tTag.ulTag)
		local strInstName = taglist.getTagInstanceName(tTag)
		print(strDesc, strInstName)
		if strDesc and strInstName then
			strDesc = strDesc .. ": " .. strInstName
		end
		if strDesc then
			table.insert(m_pages, {desc=strDesc, tag=tTag})
			m_book:AddPage(m_bookPanel, strDesc)
		end
	end
	m_book:Connect(m_bookId, wx.wxEVT_COMMAND_TREEBOOK_PAGE_CHANGING, OnPageChanging)
	m_book:Connect(m_bookId, wx.wxEVT_COMMAND_TREEBOOK_PAGE_CHANGED, OnPageChanged)
	if #tagList > 0 then
		m_book:SetSelection(0)
		m_book:Fit()
	end
end


--- Remove all pages from the notebook.
function destroyEditors()
	m_book:Disconnect(m_bookId, wx.wxEVT_COMMAND_TREEBOOK_PAGE_CHANGING)
	m_book:Disconnect(m_bookId, wx.wxEVT_COMMAND_TREEBOOK_PAGE_CHANGED)
	clearPage()
	local iPages = m_book:GetPageCount()
	
	for i=1, iPages do
		-- print(m_book:GetPageCount())
		m_book:RemovePage(0)
	end
	m_tagList = {}
	m_pages = {}
	-- print(m_book:GetPageCount())
end


--- Get the current tags as a binary string.
-- Reads the values off the edit controls, and
-- shows an error message if any values are invalid.
-- @return abTags The tag block as a binary string
function getTagBin()
	if readbackPage() then
		local bin = taglist.paramsToBin(m_tagList)
		print("length of binary: " .. bin:len() .. " bytes.")
		hexdump.printHex(bin, "0x%04x ", 16, true)
		return bin
	end
end

--- Create the editor for a tag.
-- @param iPage the page number, i.e. the number of the tag in taglist.
function enterPage(iPage)
	-- get strEditorName, tEditorParams, strDatatype
	local pageentry = m_pages[iPage]
	local strDesc, tTag = pageentry.desc, pageentry.tag
	local ulTag, abValue = tTag.ulTag, tTag.abValue
	local strEditorName, tEditorParams = taglist.getTagEditorInfo(ulTag)
	local strTagName, tTagDesc = taglist.getParamTypeDesc(ulTag)
	assert(tTagDesc, "tag "..ulTag.." not found")
	local strDatatype = tTagDesc.datatype
	
	-- instantiate the editor and the edit control
	local tEditPackage = _G[strEditorName]
	assert(tEditPackage, "package " .. strEditorName .. " not available")
	local editor = tEditPackage.new(strDatatype, tEditorParams)
	m_bookPanel:Freeze()
	local editCtrl = editor:create(m_bookPanel)
	-- set the value
	editor:setValue(abValue)

	if taglist.isReadOnly(tTagDesc) then
		structedit.disableControl(editCtrl)
		--if editor.disable then
		--	editor:disable()
		--else
		--	editCtrl:Enable(false)
		--end
	end
	
	m_editor = editor
	m_editCtrl = editCtrl
	m_tag = tTag
	
	nxoeditor.showTagHelp(tTagDesc)
	
	-- insert into panel/sizer
	m_bookPanelSizer:Add(editCtrl)
	m_editCtrl:Fit()
	m_bookPanel:FitInside()
	m_bookPanel:Layout()
	m_bookPanel:Thaw()
	m_bookPanel:Refresh()
	
end

--- Read back the values in the currently displayed editor.
-- If ok, store the values in the current tag. Otherwise show
-- an error message
-- @return true if all values could be read back, false if there were errors.
function readbackPage()
	if m_editor and m_tag then
		local fValid, astrErrors = m_editor:isValid()
		if fValid then
			local abNewValue = m_editor:getValue()
			m_tag.abValue = abNewValue
			return true
		else
			local strMsg = astrErrors and 
			"Please enter correct values for the following parameters:\n"
			.. table.concat(taglist.makeErrorStrings(astrErrors), "\n") 
			or
			"Please check your input"
			errorDialog("Incorrect entries", strMsg)
			return false
		end
	else
		return true
	end
end

--- Clear the notebook panel. 
function clearPage()
	if m_editCtrl then
		m_bookPanelSizer:Detach(m_editCtrl)
		m_bookPanel:RemoveChild(m_editCtrl)
		m_editCtrl:Destroy()
		m_editor = nil
		m_editCtrl = nil
		m_tag = nil
	end
end

--[[
function clearPage()
	local node = m_bookPanel:GetChildren():GetFirst()
	local win
	while node do
		win = node:GetData():DynamicCast("wxWindow")
		m_bookPanelSizer:Detach(win)
		m_bookPanel:RemoveChild(win)
		win:Destroy()
		node = node:GetNext()
	end
end
--]]

--- Initialize the notebook and the contents panel to hold editors.
function createTaglistPanel(parent)
	m_bookId = tester.nextID()
	m_book = wx.wxTreebook(parent, m_bookId,
		wx.wxDefaultPosition, wx.wxDefaultSize, wx.wxNB_LEFT)
	
	m_bookPanel = nil

	m_parent = parent
	
	m_tagList = {}
	m_pages = {}
	m_editor = nil
	m_editCtrl = nil
	m_tag = nil
	return m_book
end