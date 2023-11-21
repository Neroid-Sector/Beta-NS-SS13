/** Radio channels */
export const CHANNELS = ['Say', 'Comms', 'Me', 'OOC', 'LOOC'] as const;

/** Window sizes in pixels */
export enum WINDOW_SIZES {
  small = 30,
  medium = 50,
  large = 70,
  width = 380,
}

/** Line lengths for autoexpand */
export enum LINE_LENGTHS {
  small = 38,
  medium = 76,
}

/**
 * Radio prefixes.
 * Contains the properties:
 * id - string. css class identifier.
 * label - string. button label.
 */
export const RADIO_PREFIXES = {
  ':m ': {
    id: 'medsci',
    label: 'MedSci',
  },
  ':n ': {
    id: 'engi',
    label: 'Engi',
  },
  ':g ': {
    id: 'ship',
    label: 'Ship',
  },
  ':v ': {
    id: 'command',
    label: 'Cmd.',
  },
  ':a ': {
    id: 'alpha',
    label: 'Alpha',
  },
  ':b ': {
    id: 'bravo',
    label: 'Bravo',
  },
  ':c ': {
    id: 'charlie',
    label: 'Charl.',
  },
  ':d ': {
    id: 'delta',
    label: 'Delta',
  },
  ':e ': {
    id: 'echo',
    label: 'Echo',
  },
  ':f ': {
    id: 'foxtrot',
    label: 'Foxtr.',
  },
  ':p ': {
    id: 'security',
    label: 'MP',
  },
  ':u ': {
    id: 'req',
    label: 'Req',
  },
  ':j ': {
    id: 'jtac',
    label: 'JTAC',
  },
  ':t ': {
    id: 'intel',
    label: 'Int',
  },
  ':y ': {
    id: 'wy',
    label: 'W-Y',
  },
  ':o ': {
    id: 'colony',
    label: 'Colony',
  },
  ':z ': {
    id: 'highcom',
    label: 'HC',
  },
  ':k ': {
    id: 'sof',
    label: 'SOF',
  },
  ':q ': {
    id: 'hive',
    label: 'Hive',
  },
  '#m ': {
    id: 'upp-med',
    label: 'UPP Med',
  },
  '#n ': {
    id: 'upp-engi',
    label: 'UPP Engi',
  },
  '#g ': {
    id: 'clf',
    label: 'clf',
  },
  '#v ': {
    id: 'upp-cmd',
    label: 'UPP Cmd.',
  },
  '#a ': {
    id: 'clf-med',
    label: 'CLF Med',
  },
  '#b ': {
    id: 'clf-engi',
    label: 'CLF Engi',
  },
  '#c ': {
    id: 'clf-cmd',
    label: 'CLF Cmd.',
  },
  '#d ': {
    id: 'clf-cct',
    label: 'CLF CCT',
  },
  '#e ': {
    id: 'pmc-engi',
    label: 'PMC Engi',
  },
  '#f ': {
    id: 'pmc-med',
    label: 'PMC Med',
  },
  '#p ': {
    id: 'pmc',
    label: 'PMC',
  },
  '#u ': {
    id: 'upp',
    label: 'UPP',
  },
  '#j ': {
    id: 'upp-cct',
    label: 'UPP CCT',
  },
  '#t ': {
    id: 'upp-kdo',
    label: 'UPP Kdo',
  },
  '#y ': {
    id: 'wy',
    label: 'W-Y',
  },
  '#o ': {
    id: 'pmc-cct',
    label: 'PMC CCT',
  },
  '#z ': {
    id: 'pmc-cmd',
    label: 'PMC Cmd.',
  },
  '#k ': {
    id: 'specops',
    label: 'SpecOps',
  },
  '#q ': {
    id: 'hive',
    label: 'Hive',
  },
  '#M ': {
    id: 'upp-med',
    label: 'UPP Med',
  },
  '#N ': {
    id: 'upp-engi',
    label: 'UPP Engi',
  },
  '#G ': {
    id: 'clf',
    label: 'clf',
  },
  '#V ': {
    id: 'upp-cmd',
    label: 'UPP Cmd.',
  },
  '#A ': {
    id: 'clf-med',
    label: 'CLF Med',
  },
  '#B ': {
    id: 'clf-engi',
    label: 'CLF Engi',
  },
  '#C ': {
    id: 'clf-cmd',
    label: 'CLF Cmd.',
  },
  '#D ': {
    id: 'clf-cct',
    label: 'CLF CCT',
  },
  '#E ': {
    id: 'pmc-engi',
    label: 'PMC Engi',
  },
  '#F ': {
    id: 'pmc-med',
    label: 'PMC Med',
  },
  '#P ': {
    id: 'pmc',
    label: 'PMC',
  },
  '#U ': {
    id: 'upp',
    label: 'UPP',
  },
  '#J ': {
    id: 'upp-cct',
    label: 'UPP CCT',
  },
  '#T ': {
    id: 'upp-kdo',
    label: 'UPP Kdo',
  },
  '#Y ': {
    id: 'wy',
    label: 'W-Y',
  },
  '#O ': {
    id: 'pmc-cct',
    label: 'PMC CCT',
  },
  '#Z ': {
    id: 'pmc-cmd',
    label: 'PMC Cmd.',
  },
  '#K ': {
    id: 'specops',
    label: 'SpecOps',
  },
  '#Q ': {
    id: 'hive',
    label: 'Hive',
  },
  ':W ': {
    id: 'whisper',
    label: 'Whisper',
  },
  '.W ': {
    id: 'whisper',
    label: 'Whisper',
  },
  '#W ': {
    id: 'whisper',
    label: 'Whisper',
  },
  ':w ': {
    id: 'whisper',
    label: 'Whisper',
  },
  '.w ': {
    id: 'whisper',
    label: 'Whisper',
  },
  '#w ': {
    id: 'whisper',
    label: 'Whisper',
  },
  ':H ': {
    id: 'department',
    label: 'Depart.',
  },
  '.H ': {
    id: 'department',
    label: 'Depart.',
  },
  '#H ': {
    id: 'department',
    label: 'Depart.',
  },
  ':h ': {
    id: 'department',
    label: 'Depart.',
  },
  '.h ': {
    id: 'department',
    label: 'Depart.',
  },
  '#h ': {
    id: 'department',
    label: 'Depart.',
  },
  ':l ': {
    id: 'comms',
    label: 'L Hand',
  },
  '.l ': {
    id: 'comms',
    label: 'L Hand',
  },
  '#l ': {
    id: 'comms',
    label: 'L Hand',
  },
  ':L ': {
    id: 'comms',
    label: 'L Hand',
  },
  '.L ': {
    id: 'comms',
    label: 'L Hand',
  },
  '#L ': {
    id: 'comms',
    label: 'L Hand',
  },
  ':r ': {
    id: 'comms',
    label: 'R Hand',
  },
  '.r ': {
    id: 'comms',
    label: 'R Hand',
  },
  '#r ': {
    id: 'comms',
    label: 'R Hand',
  },
  ':R ': {
    id: 'comms',
    label: 'R Hand',
  },
  '.R ': {
    id: 'comms',
    label: 'R Hand',
  },
  '#R ': {
    id: 'comms',
    label: 'R Hand',
  },
  ':i ': {
    id: 'comms',
    label: 'Intercom',
  },
  '.i ': {
    id: 'comms',
    label: 'Intercom',
  },
  '#i ': {
    id: 'comms',
    label: 'Intercom',
  },
  ':I ': {
    id: 'comms',
    label: 'Intercom',
  },
  '.I ': {
    id: 'comms',
    label: 'Intercom',
  },
  '#I ': {
    id: 'comms',
    label: 'Intercom',
//LIBERTY STAR
  },
  '-G ': {
    id: 'Liberty Star General',
    label: 'General',
  },
  '-V ': {
    id: 'Liberty Star Command',
    label: 'Command',
  },
  '-M ': {
    id: 'Liberty Star Med',
    label: 'Medical',
  },
  '-E ': {
    id: 'Liberty Star Engi',
    label: 'Engineering',
  },
  '-C ': {
    id: 'Liberty Star Cargo',
    label: 'Cargo',
  },
//Aegis
  '$G ': {
    id: 'Aegis General',
    label: 'Medical',
  },
  '$V ': {
    id: 'Aegis Command',
    label: 'Command',
  },
  '$M ': {
    id: 'Aegis Med',
    label: 'Medical',
  },
  '$E ': {
    id: 'Aegis Engi',
    label: 'Engineering',
  },
  '$C ': {
    id: 'Aegis Cargo',
    label: 'Cargo',
  },
//Rubicon Run
'@G ': {
  id: 'Rubicon Run General',
  label: 'General',
},
'@V ': {
  id: 'Rubicon Run Command',
  label: 'Command',
},
'@M ': {
  id: 'Rubicon Run Med',
  label: 'Medical',
},
'@E ': {
  id: 'Rubicon Run Engi',
  label: 'Engineering',
},
'@C ': {
  id: 'Rubicon Run Cargo',
  label: 'Cargo',
},
//Patton's Ghost
'&G ': {
  id: 'Pattons Ghost General',
  label: 'General',
},
'&V ': {
  id: 'Pattons Ghost Command',
  label: 'Command',
},
'&M ': {
  id: 'Pattons Ghost Med',
  label: 'Medical',
},
'&E ': {
  id: 'Rubicon Run Engi',
  label: 'Engineering',
},
'&C ': {
  id: 'Pattons Ghost Engi',
  label: 'Cargo',
},

} as const;
