local E, L, V, P, G = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB

E.Options.args.profilehelper = {
	type = "group",
	name = "Profile Helper",
	order = -2,
	args = {
		intro = {
			order = 0,
			type = "description",
			name = "This section will help reset specfic settings back to default.",
		},
		general = {
			order = 1,
			type = 'execute',
			name = 'General',
			confirm = true,
			confirmText = 'Are you sure you want to reset General settings?',
			func = function() E.db.general = P.general end,
		},
		actionbar = {
			order = 2,
			type = 'execute',
			name = 'ActionBar',
			confirm = true,
			confirmText = 'Are you sure you want to reset ActionBar settings?',
			func = function() E.db.actionbar = P.actionbar end,
		},
		bags = {
			order = 3,
			type = 'execute',
			name = 'Bags',
			confirm = true,
			confirmText = 'Are you sure you want to reset Bags settings?',
			func = function() E.db.bags = P.bags end,
		},
		auras = {
			order = 4,
			type = 'execute',
			name = 'Auras',
			confirm = true,
			confirmText = 'Are you sure you want to reset Auras settings?',
			func = function() E.db.auras = P.auras end,
		},
		chat = {
			order = 5,
			type = 'execute',
			name = 'Chat',
			confirm = true,
			confirmText = 'Are you sure you want to reset Chat settings?',
			func = function() E.db.chat = P.chat end,
		},
		cooldown = {
			order = 6,
			type = 'execute',
			name = 'Cooldown',
			confirm = true,
			confirmText = 'Are you sure you want to reset Cooldown settings?',
			func = function() E.db.cooldown = P.cooldown end,
		},
		databars = {
			order = 7,
			type = 'execute',
			name = 'Databars',
			confirm = true,
			confirmText = 'Are you sure you want to reset Databars settings?',
			func = function() E.db.databars = P.databars end,
		},
		datatexts = {
			order = 8,
			type = 'execute',
			name = 'DataTexts',
			confirm = true,
			confirmText = 'Are you sure you want to reset DataTexts settings?',
			func = function() E.db.datatexts = P.datatexts end,
		},
		nameplates = {
			order = 9,
			type = 'execute',
			name = 'Nameplates',
			confirm = true,
			confirmText = 'Are you sure you want to reset Nameplates settings?',
			func = function() E.db.nameplates = P.nameplates end,
		},
		tooltip = {
			order = 10,
			type = 'execute',
			name = 'Tooltip',
			confirm = true,
			confirmText = 'Are you sure you want to reset Tooltip settings?',
			func = function() E.db.tooltip = P.tooltip end,
		},
		uniframes = {
			order = 11,
			type = 'execute',
			name = 'UnitFrames',
			confirm = true,
			confirmText = 'Are you sure you want to reset UnitFrames settings?',
			func = function() E.db.unitframe = P.unitframe end,
		},
	},
}
