local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

local _G = _G
local unpack = unpack
local hooksecurefunc = hooksecurefunc

local function MailFrameSkin()
	for i = 1, _G.ATTACHMENTS_MAX_SEND do
		local btn = _G["SendMailAttachment"..i]
		if not btn.skinned then
			btn:StripTextures()
			btn:SetTemplate(nil, true)
			btn:StyleButton()
			btn.skinned = true
			hooksecurefunc(btn.IconBorder, 'SetVertexColor', function(self, r, g, b)
				self:GetParent():SetBackdropBorderColor(r, g, b)
				self:SetTexture()
			end)
			hooksecurefunc(btn.IconBorder, 'Hide', function(self)
				self:GetParent():SetBackdropBorderColor(unpack(E.media.bordercolor))
			end)
		end

		local t = btn:GetNormalTexture()
		if t then
			t:SetTexCoord(unpack(E.TexCoords))
			t:SetInside()
		end
	end
end

function S:MailFrame()
	if not (E.private.skins.blizzard.enable and E.private.skins.blizzard.mail) then return end

	local MailFrame = _G.MailFrame
	S:HandlePortraitFrame(MailFrame, true)

	for i = 1, _G.INBOXITEMS_TO_DISPLAY do
		local bg = _G["MailItem"..i]
		bg:StripTextures()

		local btn = _G["MailItem"..i.."Button"]
		btn:StripTextures()
		btn:SetTemplate(nil, true)
		btn:StyleButton()

		local t = _G["MailItem"..i.."ButtonIcon"]
		t:SetTexCoord(unpack(E.TexCoords))
		t:SetInside()

		local ib = _G["MailItem"..i.."ButtonIconBorder"]
		hooksecurefunc(ib, 'SetVertexColor', function(s, r, g, b)
			s:GetParent():SetBackdropBorderColor(r, g, b)
			s:SetTexture()
		end)
		hooksecurefunc(ib, 'Hide', function(s)
			s:GetParent():SetBackdropBorderColor(unpack(E.media.bordercolor))
		end)
	end

	_G.InboxFrame:CreateBackdrop("Transparent")
	_G.InboxFrame.backdrop:SetPoint("TOPLEFT", _G.MailItem1, "TOPLEFT")
	_G.InboxFrame.backdrop:SetPoint("BOTTOMRIGHT", _G.MailItem7, "BOTTOMRIGHT")

	S:HandleNextPrevButton(_G.InboxPrevPageButton, nil, nil, true)
	S:HandleNextPrevButton(_G.InboxNextPageButton, nil, nil, true)
	_G.InboxPrevPageButton:StripTexts()
	_G.InboxNextPageButton:StripTexts()

	_G.MailFrameTab1:StripTextures()
	_G.MailFrameTab2:StripTextures()
	S:HandleTab(_G.MailFrameTab1)
	S:HandleTab(_G.MailFrameTab2)

	-- send mail
	_G.SendMailScrollFrame:StripTextures(true)
	_G.SendMailScrollFrame:SetTemplate()

	S:HandleScrollBar(_G.SendMailScrollFrameScrollBar)

	S:HandleEditBox(_G.SendMailNameEditBox)
	S:HandleEditBox(_G.SendMailSubjectEditBox)
	S:HandleEditBox(_G.SendMailMoneyGold)
	S:HandleEditBox(_G.SendMailMoneySilver)
	S:HandleEditBox(_G.SendMailMoneyCopper)
	_G.SendMailMoneyBg:Kill()
	_G.SendMailMoneyInset:StripTextures()
	_G.SendMailSubjectEditBox:SetPoint("TOPLEFT", _G.SendMailNameEditBox, "BOTTOMLEFT", 0, -10)
	_G.SendMailSubjectEditBox:SetHeight(18)
	_G.SendMailNameEditBox:SetHeight(18)
	_G.SendMailFrame:StripTextures()

	hooksecurefunc("SendMailFrame_Update", MailFrameSkin)

	S:HandleButton(_G.SendMailMailButton)
	S:HandleButton(_G.SendMailCancelButton)

	S:HandleRadioButton(_G.SendMailSendMoneyButton)
	S:HandleRadioButton(_G.SendMailCODButton)

	-- open mail (cod)
	_G.OpenMailFrame:StripTextures(true)
	_G.OpenMailFrame:SetTemplate("Transparent")
	_G.OpenMailFrameInset:Kill()

	S:HandleCloseButton(_G.OpenMailFrameCloseButton)
	S:HandleButton(_G.OpenMailReportSpamButton)
	S:HandleButton(_G.OpenMailReplyButton)
	S:HandleButton(_G.OpenMailDeleteButton)
	S:HandleButton(_G.OpenMailCancelButton)
	S:HandleButton(_G.OpenAllMail)

	_G.InboxFrame:StripTextures()
	_G.MailFrameInset:Kill()

	_G.OpenMailScrollFrame:StripTextures(true)
	_G.OpenMailScrollFrame:SetTemplate()

	S:HandleScrollBar(_G.OpenMailScrollFrameScrollBar)

	_G.InboxPrevPageButton:SetPoint("BOTTOMLEFT", 30, 100)
	_G.InboxNextPageButton:SetPoint("BOTTOMRIGHT", -80, 100)
	_G.InvoiceTextFontNormal:FontTemplate(E.media.normFont, 13)
	_G.MailTextFontNormal:FontTemplate(E.media.normFont, 13)
	_G.InvoiceTextFontNormal:SetTextColor(1, 1, 1)
	_G.MailTextFontNormal:SetTextColor(1, 1, 1)
	_G.OpenMailArithmeticLine:Kill()

	_G.OpenMailLetterButton:StripTextures()
	_G.OpenMailLetterButton:SetTemplate(nil, true)
	_G.OpenMailLetterButton:StyleButton()
	_G.OpenMailLetterButtonIconTexture:SetTexCoord(unpack(E.TexCoords))
	_G.OpenMailLetterButtonIconTexture:SetInside()

	_G.OpenMailMoneyButton:StripTextures()
	_G.OpenMailMoneyButton:SetTemplate(nil, true)
	_G.OpenMailMoneyButton:StyleButton()
	_G.OpenMailMoneyButtonIconTexture:SetTexCoord(unpack(E.TexCoords))
	_G.OpenMailMoneyButtonIconTexture:SetInside()

	for i = 1, _G.ATTACHMENTS_MAX_SEND do
		local btn = _G["OpenMailAttachmentButton"..i]
		btn:StripTextures()
		btn:SetTemplate(nil, true)
		btn:StyleButton()

		hooksecurefunc(btn.IconBorder, 'SetVertexColor', function(s, r, g, b)
			s:GetParent():SetBackdropBorderColor(r, g, b)
			s:SetTexture()
		end)
		hooksecurefunc(btn.IconBorder, 'Hide', function(s)
			s:GetParent():SetBackdropBorderColor(unpack(E.media.bordercolor))
		end)

		local t = _G["OpenMailAttachmentButton"..i.."IconTexture"]
		if t then
			t:SetTexCoord(unpack(E.TexCoords))
			t:SetInside()
		end
	end

	_G.OpenMailReplyButton:SetPoint("RIGHT", _G.OpenMailDeleteButton, "LEFT", -2, 0)
	_G.OpenMailDeleteButton:SetPoint("RIGHT", _G.OpenMailCancelButton, "LEFT", -2, 0)
	_G.SendMailMailButton:SetPoint("RIGHT", _G.SendMailCancelButton, "LEFT", -2, 0)
end

S:AddCallback('MailFrame')
