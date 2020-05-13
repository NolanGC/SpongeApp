import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';

class Mnemonic {
  // Word Pool
  //List<String> files = [
  //  "nouns.txt",
  //  "verbs.txt",
  //  "adjectives.txt",
  //  "adverbs.txt",
  //  "colors.txt"
  //];
  List<List<String>> words = [
    [
      'actors',
      'animals',
      'armies',
      'balloons',
      'boys',
      'brothers',
      'crowds',
      'conmen',
      'crows',
      'daughters',
      'doctors',
      'dogs',
      'elephants',
      'families',
      'fish',
      'giraffes ',
      'ghosts',
      'girls',
      'horses',
      'insects',
      'jackals',
      'jesters',
      'kangaroos',
      'kings',
      'knights',
      'lawyers',
      'lions',
      'machines',
      'magicians',
      'monkeys',
      'noblemen',
      'oysters',
      'oxen',
      'people',
      'parrots',
      'queens',
      'quarterbacks',
      'residents',
      'rabbits',
      'raccoons',
      'snakes',
      'salesmen',
      'saints',
      'teachers',
      'tycoons',
      'tyrants',
      'unions',
      'users',
      'whales',
      'watchmen',
      'x-wings',
      'yaks',
      'yankees',
      'yeti',
      'zebras',
      'zealots',
      'zombies'
    ],
    [
      'attack',
      'analyze',
      'abuse',
      'baptize',
      'bash',
      'clobber',
      'chop',
      'carry',
      'detect',
      'devastate ',
      'educate',
      'elude',
      'flee',
      'fight',
      'gather',
      'hack',
      'hammer',
      'idolize',
      'identify',
      'ignite',
      'ignore',
      'judge',
      'kill',
      'lead',
      'leave',
      'make',
      'marry',
      'notice',
      'neglect',
      'observe',
      'obtain',
      'pay',
      'present',
      'promote',
      'quote',
      'question',
      'remove',
      'release',
      'reveal',
      'stop',
      'serve',
      'support',
      'shame',
      'seize',
      'take',
      'teach',
      'throw',
      'touch',
      'threaten ',
      'use',
      'urge',
      'unite',
      'unify',
      'utilize',
      'visit',
      'view',
      'vaccinate',
      'watch',
      'warn',
      'wash',
      'x-ray',
      'yank',
      'yield',
      'zone'
    ],
    [
      'ardent',
      'artistic',
      'big ',
      'boney',
      'beautful ',
      'cautious',
      'caring',
      'cool',
      'daring',
      'dodgey',
      'eager',
      'established',
      'fair',
      'furry',
      'great',
      'good',
      'giant',
      'hairy',
      'huge',
      'insane',
      'idle',
      'jazzy',
      'jesting',
      'killer',
      'kind',
      'kingly',
      'keen',
      'lame',
      'lazy',
      'mad',
      'majestic',
      'naive',
      'nasty',
      'natural',
      'obese',
      'obediant',
      'patient',
      'perfect',
      'playful',
      'quiet',
      'quarrelsome',
      'rabid',
      'radiant',
      'radical',
      'sad',
      'sassy',
      'sly',
      'tall',
      'terrible',
      'talented',
      'ugly',
      'unique',
      'valiant',
      'vicious',
      'wacky',
      'wealthy',
      'weak',
      'wet',
      'xenophobic',
      'young',
      'youthful',
      'yucky',
      'zealous',
      'zesty'
    ],
    [
      'angrily',
      'ably',
      'blindly',
      'boldly',
      'bravely',
      'carefully',
      'calmly',
      'daintily',
      'daringly',
      'excitedly',
      'eagerly',
      'easily',
      'fairly',
      'firmly',
      'fiercely',
      'gently',
      'greedily',
      'happily',
      'hastily',
      'hatefully',
      'instantly',
      'immediately',
      'innocently ',
      'joyfully',
      'kindly',
      'keenly',
      'lazily',
      'loudly',
      'lovingly',
      'loyally',
      'madly',
      'magically',
      'maniacally',
      'naturally',
      'nervously',
      'obediently',
      'obnoxiously',
      'patiently',
      'politely',
      'quietly ',
      'quickly',
      'rudely',
      'repeatedly',
      'safely',
      'silently',
      'slowly',
      'softly',
      'toughly',
      'tamely',
      'tastefully',
      'violently',
      'wisely',
      'wearily',
      'youthfully',
      'zestily'
    ],
    [
      'amber',
      'azure',
      'black',
      'blue',
      'brown',
      'crimson',
      'cyan',
      'denim',
      'emerald',
      'floral',
      'gold',
      'green',
      'grey',
      'hazel',
      'indigo',
      'ivory',
      'jade',
      'khaki',
      'lavender',
      'magenta',
      'maroon',
      'neon',
      'orange',
      'pink',
      'purple',
      'quartz',
      'red',
      'scarlet',
      'silver',
      'tan',
      'turquoise',
      'umber',
      'violet',
      'white',
      'xanthic',
      'yellow',
      'zinc'
    ]
  ];
  Mnemonic() {}

  String generateMnemonic(String data) {
    List<String> key = getFirstLetters(data);
    String pattern = getPattern(key.length);
    String device = "";
    int index = 0;
    var rng = new Random();
    while (index < pattern.length) {
      List<String> pool;
      if (pattern[index] == 'n') {
        pool = startsWith(key[index], words[0]);
      } else if (pattern[index] == 'v') {
        pool = startsWith(key[index], words[1]);
      } else if (pattern[index] == 'a') {
        pool = startsWith(key[index], words[2]);
      } else if (pattern[index] == 'x') {
        pool = startsWith(key[index], words[3]);
      } else if (pattern[index] == 'c') {
        pool = startsWith(key[index], words[4]);
      }
      int choice = rng.nextInt(pool.length);
      device += pool[choice] + " ";
      index++;
    }
    return device;
  }

  List<String> startsWith(String s, List<String> list) {
    List<String> valid = new List<String>();
    for (var i = 0; i < list.length; i++) {
      if (list[i].substring(0, 1) == s) {
        valid.add(list[i]);
      }
    }
    return valid;
  }

  List<String> getFirstLetters(String sentence) {
    List<String> words = sentence.split(" ");
    for (var i = 0; i < words.length; i++) {
      words[i] = '${words[i][0]}';
    }
    return words;
  }

  String getPattern(int n) {
    List<String> structure = [
      '',
      'n',
      'nv',
      'nxv',
      'nxvn',
      'anxvn',
      'acnxvn',
      'acnxvan',
      'aacnxvan',
      'aacnxvacn',
      'aacnxvaacn'
    ];
    return structure[n];
  }
}
