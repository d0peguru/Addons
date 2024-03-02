-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Resistant','Proc','OccultAcumen','9k')
    state.IdleMode:options('Normal','PDT','Sphere')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None','Bunzi','Akademos')
--	,'Khatvanga'

	gear.nuke_jse_back = {name="Lugh's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
	gear.heal_jse_back = {name="Lugh's Cape",augments={'MND+30','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_waist = "Refoccilation Stone"
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	gear.Chironic_WSD = { name="Chironic Hose", augments={'Weapon skill damage +5%','AGI+5','Accuracy+11 Attack+11','Mag. Acc.+10 "Mag.Atk.Bns."+10',}}
	gear.Chironic_MAB = { name="Chironic Hose", augments={'Accuracy+13','Potency of "Cure" effect received+1%','Accuracy+4 Attack+4','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind !q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind ^q gs c weapons default;gs c reset CastingMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace gs c scholar speed')
	send_command('bind @q gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind ^- input /ja "Addendum: Black" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind !- input /ja "Addendum: White" <me>')
	send_command('bind @r input /ma "Refresh" <stal>')
	send_command('bind ^\\\\ input /ma "Protect V" <me>')
	send_command('bind @\\\\ input /ma "Shell V" <me>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	send_command('bind @s input /ja "Sublimation" <me>')
	send_command('bind @a input /ma "Aspir II" <t>')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +1"}
	sets.precast.JA['Enlightenment'] = {} --body="Peda. Gown +1"

    -- Fast cast sets for spells

    sets.precast.FC = {
		ammo="Incantor Stone",
		head="Psycloth Tiara",ear1="Etiolation Earring", ear2="Loquacious earring", neck="Baetyl Pendant",
        body="Pinga Tunic",hands="Mallquis cuffs +1",ring1="Lebeche Ring", ring2="Kishar Ring",
        back="Swith Cape",waist="Witful Belt",legs="psycloth lappas",Feet="Regal Pumps +1",		
		
		--ammo="Impatiens",
		--head="Welkin Crown",ear1="Etiolation Earring",ear2="Loquacious earring",neck="Baetyl Pendant",
       -- body="Anhur Robe",hands="Acad. Bracers +2",ring1="Lebeche Ring", ring2="Kishar Ring",
        --back="Swith Cape",waist="Channeler's Stone",legs="psycloth lappas",Feet="Regal Pumps +1",
		
		--main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",
		--head="Merlinic Hood", 
		--feet="Acad. Loafers +3"
		}
		
	sets.precast.FC.Arts = {}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear1="Malignance Earring"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity",sub="Clerisy Strap +1",body="Heka's Kalasiris"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Myrkr'] = {ammo="Staunch Tathlum +1",
		head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Evans Earring",ear2="Etiolation Earring",
		body="Amalric Doublet",hands="Regal Cuffs",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Aurist's Cape +1",waist="Yamabuki-no-Obi",legs="Psycloth Lappas",feet="Medium's Sabots"
		}

    -- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",hands="Agwu's Gages",neck="//Argute Stole +2",ring1="Mujin Band",ring2="jhakri ring",legs="Agwu Slops",feet="Agwu's Pigaches"}
--	ring2="Locus Ring"
	
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
    sets.midcast.Cure = {
			sub="Sors Shield",
			ammo="Hydrocera",
			head='Vanya Hood',
			body={ name="Kaykaus Bliaut +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
			hands="Pedagogy Bracers +3",
			legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
			feet={ name="Kaykaus Boots +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
			neck="Nodens Gorget",
			waist="Luminary Sash",
			left_ear={ name="Light Earring", augments={'"Resist Stun"+3','"Resist Blind"+2',}},
			right_ear="Mendi. Earring",
			left_ring="Stikini Ring",
			right_ring="Naji's Loop",
			back="Solemnity Cape",
--		main="Serenity",sub="Curatio Grip",ammo="Hasty Pinion +1",
--      head="Vanya Hood",neck="Incanter's Torque",ear1="Meili Earring",ear2="Malignance Earring",
--      body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Lebeche Ring",
--      back="Tempered Cape +1",waist="Luminary Sash",legs="Chironic Hose",feet="Vanya Clogs"
		
--		head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Meili Earring",ear2="Malignance Earring",
--		body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Lebeche Ring",
--	    back="Tempered Cape +1",waist="Luminary Sash",legs="Chironic Hose",feet="Kaykaus Boots"
		}
		
    sets.midcast.LightWeatherCure = {
		main="Chatoyant Staff",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Incanter's Torque",ear1="Meili Earring",ear2="Malignance Earring",
        body="Kaykaus Bliaut +1",hands="Pedagogy Bracers +3",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs=Chironic_MAB,feet="Kaykaus Boots +1"
		}
		
    sets.midcast.LightDayCure = {
		main="Serenity",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Meili Earring",ear2="Malignance Earring",
        body="Kaykaus Bliaut +1",hands="Pedagogy Bracers +3" ,ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs=Chironic_MAB,feet="Kaykaus Boots +1"
		}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
	sets.midcast.Cursna = {main=gear.grioavolr_fc_staff,sub="Clemency Grip",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Debilis Medallion",ear1="Meili Earring",ear2="Malignance Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Haoma's Ring",ring2="Menelaus's Ring",
		back="Oretan. Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Vanya Clogs"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	sets.midcast['Enhancing Magic'] = {
		ammo="Savant's Treatise",
        head="Telchine Cap",neck="Incanter's Torque",ear1="Augment. Earring",ear2="Andoaa Earring",
        body="Telchine Chasuble",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",        
        back="Fi Follet Cape +1",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"
		}
		--main=gear.gada_enhancing_club,sub="Ammurapi Shield","Savant's Treatise",
		--head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		--body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		--back="Perimede Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"


    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {head='Arbatel Bonnet +2',body={ name="Telchine Chas.", augments={'"Regen" potency+3',}},hands={ name="Telchine Gloves", augments={'"Regen" potency+3',}},legs={ name="Telchine Braconi", augments={'"Regen" potency+2',}},feet={ name="Telchine Pigaches", augments={'"Regen" potency+3',}}})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers +3"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

	sets.midcast['Enfeebling Magic'] = {
		main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Acad. Mortar. +3",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Chironic Doublet",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs=gear.Chironic_MAB,feet="Uk'uxkaj Boots"
		}
	
	sets.midcast['Enfeebling Magic'].Resistant = {
		main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Acad. Mortar. +3",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
        body="Chironic Doublet",hands="Acad. Bracers +3",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs=gear.Chironic_MAB,feet="Medium's Sabots"
		}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Malignance Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear1="Malignance Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",back=gear.nuke_jse_back,waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring2="Stikini Ring +1",feet=gear.chironic_nuke_feet})

    sets.midcast['Dark Magic'] = {
		main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Malignance Earring",
        body="Chironic Doublet",hands="Acad. Bracers +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs=gear.Chironic_MAB,feet="Arbatel Loafers +3"
		}

    sets.midcast.Kaustra = {
		ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Pedagogy Bracers +3",ring1="Freke Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Refoccilation Stone",legs="Merlinic Shalwar",feet="Arbatel Loafers +3"
		}
		
    sets.midcast.Kaustra.Resistant = {
		main=gear.grioavolr_nuke_staff,sub="Enki Strap",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Crematio Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Pedagogy Bracers +3",ring1="Shiva Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet="Arbatel Loafers +3"
		}

    sets.midcast.Drain = {
		main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Chironic Doublet",hands="Acad. Bracers +3",ring1="Evanescence Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs=gear.Chironic_MAB,feet="Arbatel Loafers +3"
		}
		
    sets.midcast.Drain.Resistant = {
		main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Chironic Doublet",hands="Acad. Bracers +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs=Chironic_MAB,feet="Arbatel Loafers +3"
		}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {
		main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
        head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
        body="Zendik Robe",hands="Acad. Bracers +3",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"
		}

    sets.midcast.Stun.Resistant = {
		main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Acad. Mortar. +3",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Zendik Robe",hands="Acad. Bracers +3",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs=Chironic_MAB,feet="Arbatel Loafers +3"
		}

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
		main="Bunzi's Rod",
	    ammo="Ghastly Tathlum +1",
		head="Agwu's Cap",
		body="Arbatel Gown +2",
		hands="Pedagogy Bracers +3",
		legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
		feet="Arbatel Loafers +3",
		neck="Sibyl Scarf",
		waist="Hachirin-no-Obi",
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Jhakri Ring",
		right_ring="Acumen Ring",
		back="Romanus Cape",
		
--		main="Rubicundity",sub="Ammurapi Shield",ammo="ghastly Tathlum +1",
--      head="Agwu's Cap",neck="Saevus Pendant +1",ear1="Friomisi Earring",ear2="Hecate's Earring",
--      body="Arbatel Gown +2",hands="Agwu's Gages",ring1="Jhakri Ring",ring2="Acumen Ring",
--      back="searing cape",waist="Hachirin-no-Obi",legs="Agwu's Slops",feet="Agwu's Pigaches"
		}
--		{main="Daybreak",sub="Ammurapi Shield",ammo="Dosis Tathlum",
--       head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Friomisi Earring",
--        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +2",ring1="Shiva Ring +1",ring2="Freke Ring",
--       back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

    sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +2",ring1="Shiva Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet="Arbatel Loafers +3"}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Daybreak",sub="Ammurapi Shield",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +2",ring1="Shiva Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet="Arbatel Loafers +3"}
		
    sets.midcast['Elemental Magic']['9k'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +2",ring1="Shiva Ring +1",ring2="Freke Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty,ammo="Impatiens",
        head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
        body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
    sets.midcast['Elemental Magic'].OccultAcumen = {main="Khatvanga",sub="Bloodrain Strap",ammo="Seraphic Ampulla",
        head="Mall. Chapeau +2",neck="Combatant's Torque",ear1="Dedition Earring",ear2="Telos Earring",
        body=gear.merlinic_occult_body,hands=gear.merlinic_occult_hands,ring1="Rajas Ring",ring2="Petrov Ring",
        back=gear.nuke_jse_back,waist="Oneiros Rope",legs="Perdition Slops",feet="Arbatel Loafers +3"}
		
    -- Custom refinements for certain nuke tiers
--	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {ammo="ghastly Tathlum +1"})
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {ammo="Pemphredo Tathlum",ear1="Friomisi Earring",ear2="Hecate's Earring",hands="Pedagogy Bracers +3"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {ammo="Pemphredo Tathlum",ear1="Friomisi Earring",ear2="Hecate's Earring",hands="Pedagogy Bracers +3"})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {ammo="Pemphredo Tathlum"})

	sets.midcast.Helix = {main="Daybreak",sub="Ammurapi Shield",ammo="Dosis Tathlum",
        head="Peda. M.Board +3",neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Agwu's Robe",hands="Agwu's Gages",ring1="Metamor. Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist="Refoccilation Stone",legs="Agwu's Slops",feet="Arbatel Loafers +3"}
		
--	sets.midcast.Helix = {main="Daybreak",sub="Ammurapi Shield",ammo="Dosis Tathlum",
--       head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Friomisi Earring",
--        body=gear.merlinic_nuke_body,hands="Pedagogy Bracers +3",ring1="Metamor. Ring +1",ring2="Freke Ring",
--        back=gear.nuke_jse_back,waist="Refoccilation Stone",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
	
	sets.midcast.Helix.Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Sanctity Necklace",ear1="Malignance Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Pedagogy Bracers +3",ring1="Metamor. Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
	sets.midcast.Helix.Proc = {main=empty, sub=empty,ammo="Impatiens",
        head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
        body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}

	sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Twilight Cloak",hands="Acad. Bracers +3",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
		
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",ammo="Homiliary",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Amalric Doublet",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {ammo="Homiliary",
		head="Befouled Crown",neck="Warder's Charm",ear1="Etiolation Earring",ear2="savant's earring",
		body="Arbatel Gown +2",hands="Nyame Gauntlets",ring1="Stikini Ring +1",ring2="Shneddick Ring",
        back=gear.nuke_jse_back,waist="Eschan Stone",legs="Arbatel Pants +2",feet="Arbatel Loafers +3"	
		--main="Bolelabunga",sub="Genmei Shield",
		--ammo="Homiliary",
        --head="Befouled Crown",
		--neck="Loricate Torque +1",
		--ear1="Infused earring"
		--ear2="Ethereal Earring",ear2="Lifestorm earring"
        --body="Jhakri Robe +2",
		--hands=gear.merlinic_refresh_hands,
		--ring1="Stikini Ring +1",
		--ring2="Stikini Ring +1",
       -- back="Umbra Cape",
		--waist="Flax Sash",
		--legs="Assid. Pants +1",
		--feet=gear.chironic_refresh_feet
		}

    sets.idle.Sphere = set_combine(sets.idle, {body="Annoint. Kalasiris"})

    sets.idle.PDT = {
		main="Malignance Pole",sub="Oneiros Grip",ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Arbatel Gown +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Nyame Flanchard",feet='Nyame Sollerets'}
		
	sets.idle.Hippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

    sets.idle.Weak = {ammo="Impatiens",
        head="Befouled Crown",neck="Warder's Charm +1",ear1="Infused earring",ear2="Lifestorm earring",
        body="Arbatel Gown +2",hands="Jhakri cuffs +2",ring1="Warp ring",ring2="Shneddick Ring",
        back="Solemnity cape",waist="Eschan Stone",legs="Lengo Pants",feet="Jhakri pigaches +2"
		--main="Bolelabunga",sub="Genmei Shield",
		--ammo="Homiliary",
        --head="Befouled Crown",
		--neck="Loricate Torque +1",
		--ear1="Etiolation Earring",
		--ear2="Ethereal Earring",
        --body="Jhakri Robe +2",
		--hands=gear.merlinic_refresh_hands,
		--ring1="Defending Ring",
		--ring2="Dark Ring",
        --back="Umbra Cape",
		--waist="Flax Sash",
		--legs="Assid. Pants +1",
		--feet=gear.chironic_refresh_feet
		}
		
    -- Defense sets

    sets.defense.PDT = {
		main="Malignance Pole",sub="Oneiros Grip",ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Arbatel Gown +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Nyame Flanchard",feet='Nyame Sollerets'}

    sets.defense.MDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum +1",
        head="Gende. Caubeen +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Mallquis Saio +2",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}
		
    sets.defense.MEVA = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
        head=gear.merlinic_nuke_head,neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body=gear.merlinic_nuke_body,hands="Gende. Gages +1",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
	sets.Kiting = {ring2="Shneddick Ring"}
--	sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
		main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet
		}
		
	sets.engaged.PDT = {
		main="Malignance Pole", sub="Oneiros Grip",ammo="Staunch Tathlum +1",
        head="Gende. Caubeen +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Vrikodara Jupon",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Hagondes Pants +1",feet=gear.chironic_refresh_feet
		}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +2"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +2"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +2"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +2"}
    sets.buff['Penury'] = {legs="Arbatel Pants +2"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +2"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +3"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +3"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +3"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}
		
    sets.HPCure = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Unmoving Collar +1",ear1="Gifted Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Gelatinous Ring +1",ring2="Meridian Ring",
        back="Moonlight Cape",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Kaykaus Boots"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {} --legs="Academic's Pants +3"
	sets.buff['Dark Arts'] = {} --body="Academic's Gown +3"

    sets.buff.Sublimation = {head="Acad. Mortar. +3",waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Weapons sets
	sets.weapons.Bunzi = {main="Bunzi's Rod",sub="Ammurapi Shield"}
	sets.weapons.Akademos = {main="Akademos",sub="Enki Strap"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(1, 19)
		windower.chat.input('/lockstyleset 010')
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 19)
		windower.chat.input('/lockstyleset 010')
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 19)
		windower.chat.input('/lockstyleset 010')
	else
		set_macro_page(1, 19)
		windower.chat.input('/lockstyleset 010')
	end
end