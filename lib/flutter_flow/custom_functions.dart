import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? allLetterLowerCase(String? name) {
  // convert all string to lowercase
  // return uppercase letter in text
  if (name == null) {
    return null;
  }
  return name.toLowerCase();
}

String? allLetterUpperCase(String? name) {
  // convert all string to lowercase
  // return uppercase letter in text
  if (name == null) {
    return null;
  }
  return name.toUpperCase();
}

String? firstLetterUpperCase(String? name) {
  // return uppercase letter in text
  if (name == null) {
    return null;
  }
  return name.substring(0, 1).toUpperCase() + name.substring(1);
}

String? getFirstLetterOfString(String? name) {
  // Check if the name is null or empty
  if (name == null || name.isEmpty) {
    return null;
  }

  // Return the first letter from the string in uppercase
  return name.substring(0, 1).toUpperCase();
}

String? replaceWhiteSpaceWithDash(String? name) {
  // return only first letter from string and make uppercare
  if (name == null) {
    return null;
  }
  return name.replaceAll(" ", "-");
}

List<String> listAllCryptoNetwork() {
  // list state in nigeria
  return [
    'Bitcoin',
    'BNB Beacon Chain(BEP2)',
    'BNB Smart Chain(BEP20)',
    'Dogecoin',
    'Ethereum(BEP20)',
    'Ethereum(ERC20)',
    'Tron(TRC20)',
    'AVAX C-Chain',
    'Algorand',
    'Aptos',
    'Arbitrum one',
    'Ark',
    'Astar',
    'Atom',
    'Avalanche',
    'BTC(Segwit)',
    'Band Protocol',
    'Cardano',
    'Celo',
    'Chiliz Chain(CHZ)',
    'Dash',
    'DigiByte',
    'EOS',
    'Elrond',
    'Fetch.AI',
    'Filecoin',
    'Harmony',
    'Hedera Hashgraph',
    'Horizen',
    'ICON',
    'IOST',
    'IOTA',
    'Kadena',
    'Kava',
    'Kusama',
    'Lisk',
    'Litecoin',
    'NEAR Protocol',
    'NEP5',
    'Nano',
    'Oasis',
    'Ontology',
    'Optimism',
    'Polkadot',
    'Polygon',
    'Polymesh',
    'Qtum',
    'Ravencoin',
    'Solana',
    'Stellar Lumens',
    'Syscoin',
    'Tezos',
    'Theta',
    'VeChain',
    'WAX',
    'Waves',
    'Zcash',
    'Zilliqa',
  ];
}

List<dynamic> listCountriesData(String? name) {
// list state in nigeria
  final String jsonString = '''
  [
    {
      "name": "Afghanistan",
      "dial_code": "+93",
      "currency_code": "AFN",
      "currency_symbol": "؋",
      "alpha_2_code": "AF"
    },
    {
      "name": "Albania",
      "dial_code": "+355",
      "currency_code": "ALL",
      "currency_symbol": "Lek",
      "alpha_2_code": "AL"
    },
    {
      "name": "Algeria",
      "dial_code": "+213",
      "currency_code": "DZD",
      "currency_symbol": "د.ج",
      "alpha_2_code": "DZ"
    },
    {
      "name": "Andorra",
      "dial_code": "+376",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "AD"
    },
    {
      "name": "Angola",
      "dial_code": "+244",
      "currency_code": "AOA",
      "currency_symbol": "Kz",
      "alpha_2_code": "AO"
    },
    {
      "name": "Antigua and Barbuda",
      "dial_code": "+1 268",
      "currency_code": "XCD",
      "currency_symbol": "\$",
      "alpha_2_code": "AG"
    },
    {
      "name": "Argentina",
      "dial_code": "+54",
      "currency_code": "ARS",
      "currency_symbol": "\$",
      "alpha_2_code": "AR"
    },
    {
      "name": "Armenia",
      "dial_code": "+374",
      "currency_code": "AMD",
      "currency_symbol": "֏",
      "alpha_2_code": "AM"
    },
    {
      "name": "Australia",
      "dial_code": "+61",
      "currency_code": "AUD",
      "currency_symbol": "\$",
      "alpha_2_code": "AU"
    },
    {
      "name": "Austria",
      "dial_code": "+43",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "AT"
    },
    {
      "name": "Azerbaijan",
      "dial_code": "+994",
      "currency_code": "AZN",
      "currency_symbol": "₼",
      "alpha_2_code": "AZ"
    },
    {
      "name": "Bahamas",
      "dial_code": "+1 242",
      "currency_code": "BSD",
      "currency_symbol": "\$",
      "alpha_2_code": "BS"
    },
    {
      "name": "Bahrain",
      "dial_code": "+973",
      "currency_code": "BHD",
      "currency_symbol": ".د.ب",
      "alpha_2_code": "BH"
    },
    {
      "name": "Bangladesh",
      "dial_code": "+880",
      "currency_code": "BDT",
      "currency_symbol": "৳",
      "alpha_2_code": "BD"
    },
    {
      "name": "Barbados",
      "dial_code": "+1 246",
      "currency_code": "BBD",
      "currency_symbol": "\$",
      "alpha_2_code": "BB"
    },
    {
      "name": "Belarus",
      "dial_code": "+375",
      "currency_code": "BYN",
      "currency_symbol": "Br",
      "alpha_2_code": "BY"
    },
    {
      "name": "Belgium",
      "dial_code": "+32",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "BE"
    },
    {
      "name": "Belize",
      "dial_code": "+501",
      "currency_code": "BZD",
      "currency_symbol": "\$",
      "alpha_2_code": "BZ"
    },
    {
      "name": "Benin",
      "dial_code": "+229",
      "currency_code": "XOF",
      "currency_symbol": "CFA",
      "alpha_2_code": "BJ"
    },
    {
      "name": "Bhutan",
      "dial_code": "+975",
      "currency_code": "BTN",
      "currency_symbol": "Nu.",
      "alpha_2_code": "BT"
    },
    {
      "name": "Bolivia (Plurinational State of)",
      "dial_code": "+591",
      "currency_code": "BOB",
      "currency_symbol": "Bs.",
      "alpha_2_code": "BO"
    },
    {
      "name": "Bosnia and Herzegovina",
      "dial_code": "+387",
      "currency_code": "BAM",
      "currency_symbol": "KM",
      "alpha_2_code": "BA"
    },
    {
      "name": "Botswana",
      "dial_code": "+267",
      "currency_code": "BWP",
      "currency_symbol": "P",
      "alpha_2_code": "BW"
    },
    {
      "name": "Brazil",
      "dial_code": "+55",
      "currency_code": "BRL",
      "currency_symbol": "R\$",
      "alpha_2_code": "BR"
    },
    {
      "name": "Brunei Darussalam",
      "dial_code": "+673",
      "currency_code": "BND",
      "currency_symbol": "\$",
      "alpha_2_code": "BN"
    },
    {
      "name": "Bulgaria",
      "dial_code": "+359",
      "currency_code": "BGN",
      "currency_symbol": "лв",
      "alpha_2_code": "BG"
    },
    {
      "name": "Burkina Faso",
      "dial_code": "+226",
      "currency_code": "XOF",
      "currency_symbol": "CFA",
      "alpha_2_code": "BF"
    },
    {
      "name": "Burundi",
      "dial_code": "+257",
      "currency_code": "BIF",
      "currency_symbol": "FBu",
      "alpha_2_code": "BI"
    },
    {
      "name": "Cabo Verde",
      "dial_code": "+238",
      "currency_code": "CVE",
      "currency_symbol": "\$",
      "alpha_2_code": "CV"
    },
    {
      "name": "Cambodia",
      "dial_code": "+855",
      "currency_code": "KHR",
      "currency_symbol": "៛",
      "alpha_2_code": "KH"
    },
    {
      "name": "Cameroon",
      "dial_code": "+237",
      "currency_code": "XAF",
      "currency_symbol": "CFA",
      "alpha_2_code": "CM"
    },
    {
      "name": "Canada",
      "dial_code": "+1",
      "currency_code": "CAD",
      "currency_symbol": "\$",
      "alpha_2_code": "CA"
    },
    {
      "name": "Central African Republic",
      "dial_code": "+236",
      "currency_code": "XAF",
      "currency_symbol": "CFA",
      "alpha_2_code": "CF"
    },
    {
      "name": "Chad",
      "dial_code": "+235",
      "currency_code": "XAF",
      "currency_symbol": "CFA",
      "alpha_2_code": "TD"
    },
    {
      "name": "Chile",
      "dial_code": "+56",
      "currency_code": "CLP",
      "currency_symbol": "\$",
      "alpha_2_code": "CL"
    },
    {
      "name": "China",
      "dial_code": "+86",
      "currency_code": "CNY",
      "currency_symbol": "¥",
      "alpha_2_code": "CN"
    },
    {
      "name": "Colombia",
      "dial_code": "+57",
      "currency_code": "COP",
      "currency_symbol": "\$",
      "alpha_2_code": "CO"
    },
    {
      "name": "Comoros",
      "dial_code": "+269",
      "currency_code": "KMF",
      "currency_symbol": "CF",
      "alpha_2_code": "KM"
    },
    {
      "name": "Congo",
      "dial_code": "+242",
      "currency_code": "XAF",
      "currency_symbol": "CFA",
      "alpha_2_code": "CG"
    },
    {
      "name": "Congo, Democratic Republic of the",
      "dial_code": "+243",
      "currency_code": "CDF",
      "currency_symbol": "FC",
      "alpha_2_code": "CD"
    },
    {
      "name": "Costa Rica",
      "dial_code": "+506",
      "currency_code": "CRC",
      "currency_symbol": "₡",
      "alpha_2_code": "CR"
    },
    {
      "name": "Côte d'Ivoire",
      "dial_code": "+225",
      "currency_code": "XOF",
      "currency_symbol": "CFA",
      "alpha_2_code": "CI"
    },
    {
      "name": "Croatia",
      "dial_code": "+385",
      "currency_code": "HRK",
      "currency_symbol": "kn",
      "alpha_2_code": "HR"
    },
    {
      "name": "Cuba",
      "dial_code": "+53",
      "currency_code": "CUP",
      "currency_symbol": "\$",
      "alpha_2_code": "CU"
    },
    {
      "name": "Cyprus",
      "dial_code": "+357",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "CY"
    },
    {
      "name": "Czech Republic",
      "dial_code": "+420",
      "currency_code": "CZK",
      "currency_symbol": "Kč",
      "alpha_2_code": "CZ"
    },
    {
      "name": "Denmark",
      "dial_code": "+45",
      "currency_code": "DKK",
      "currency_symbol": "kr",
      "alpha_2_code": "DK"
    },
    {
      "name": "Djibouti",
      "dial_code": "+253",
      "currency_code": "DJF",
      "currency_symbol": "Fdj",
      "alpha_2_code": "DJ"
    },
    {
      "name": "Dominica",
      "dial_code": "+1767",
      "currency_code": "XCD",
      "currency_symbol": "\$",
      "alpha_2_code": "DM"
    },
    {
      "name": "Dominican Republic",
      "dial_code": "+1849",
      "currency_code": "DOP",
      "currency_symbol": "\$",
      "alpha_2_code": "DO"
    },
    {
      "name": "Ecuador",
      "dial_code": "+593",
      "currency_code": "USD",
      "currency_symbol": "\$",
      "alpha_2_code": "EC"
    },
    {
      "name": "Egypt",
      "dial_code": "+20",
      "currency_code": "EGP",
      "currency_symbol": "E£",
      "alpha_2_code": "EG"
    },
    {
      "name": "El Salvador",
      "dial_code": "+503",
      "currency_code": "USD",
      "currency_symbol": "\$",
      "alpha_2_code": "SV"
    },
    {
      "name": "Equatorial Guinea",
      "dial_code": "+240",
      "currency_code": "XAF",
      "currency_symbol": "CFA",
      "alpha_2_code": "GQ"
    },
    {
      "name": "Eritrea",
      "dial_code": "+291",
      "currency_code": "ERN",
      "currency_symbol": "Nfk",
      "alpha_2_code": "ER"
    },
    {
      "name": "Estonia",
      "dial_code": "+372",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "EE"
    },
    {
      "name": "Eswatini",
      "dial_code": "+268",
      "currency_code": "SZL",
      "currency_symbol": "E",
      "alpha_2_code": "SZ"
    },
    {
      "name": "Ethiopia",
      "dial_code": "+251",
      "currency_code": "ETB",
      "currency_symbol": "Br",
      "alpha_2_code": "ET"
    },
    {
      "name": "Fiji",
      "dial_code": "+679",
      "currency_code": "FJD",
      "currency_symbol": "\$",
      "alpha_2_code": "FJ"
    },
    {
      "name": "Finland",
      "dial_code": "+358",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "FI"
    },
    {
      "name": "France",
      "dial_code": "+33",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "FR"
    },
    {
      "name": "French Guiana",
      "dial_code": "+594",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "GF"
    },
    {
      "name": "French Polynesia",
      "dial_code": "+689",
      "currency_code": "XPF",
      "currency_symbol": "Fr",
      "alpha_2_code": "PF"
    },
    {
      "name": "Gabon",
      "dial_code": "+241",
      "currency_code": "XAF",
      "currency_symbol": "CFA",
      "alpha_2_code": "GA"
    },
    {
      "name": "Gambia",
      "dial_code": "+220",
      "currency_code": "GMD",
      "currency_symbol": "D",
      "alpha_2_code": "GM"
    },
    {
      "name": "Georgia",
      "dial_code": "+995",
      "currency_code": "GEL",
      "currency_symbol": "ლ",
      "alpha_2_code": "GE"
    },
    {
      "name": "Germany",
      "dial_code": "+49",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "DE"
    },
    {
      "name": "Ghana",
      "dial_code": "+233",
      "currency_code": "GHS",
      "currency_symbol": "₵",
      "alpha_2_code": "GH"
    },
    {
      "name": "Gibraltar",
      "dial_code": "+350",
      "currency_code": "GIP",
      "currency_symbol": "£",
      "alpha_2_code": "GI"
    },
    {
      "name": "Greece",
      "dial_code": "+30",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "GR"
    },
    {
      "name": "Greenland",
      "dial_code": "+299",
      "currency_code": "DKK",
      "currency_symbol": "kr",
      "alpha_2_code": "GL"
    },
    {
      "name": "Grenada",
      "dial_code": "+1473",
      "currency_code": "XCD",
      "currency_symbol": "\$",
      "alpha_2_code": "GD"
    },
    {
      "name": "Guadeloupe",
      "dial_code": "+590",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "GP"
    },
    {
      "name": "Guam",
      "dial_code": "+1671",
      "currency_code": "USD",
      "currency_symbol": "\$",
      "alpha_2_code": "GU"
    },
    {
      "name": "Guatemala",
      "dial_code": "+502",
      "currency_code": "GTQ",
      "currency_symbol": "Q",
      "alpha_2_code": "GT"
    },
    {
      "name": "Guinea",
      "dial_code": "+224",
      "currency_code": "GNF",
      "currency_symbol": "FG",
      "alpha_2_code": "GN"
    },
    {
      "name": "Guinea-Bissau",
      "dial_code": "+245",
      "currency_code": "XOF",
      "currency_symbol": "CFA",
      "alpha_2_code": "GW"
    },
    {
      "name": "Guyana",
      "dial_code": "+592",
      "currency_code": "GYD",
      "currency_symbol": "\$",
      "alpha_2_code": "GY"
    },
    {
      "name": "Haiti",
      "dial_code": "+509",
      "currency_code": "HTG",
      "currency_symbol": "G",
      "alpha_2_code": "HT"
    },
    {
      "name": "Honduras",
      "dial_code": "+504",
      "currency_code": "HNL",
      "currency_symbol": "L",
      "alpha_2_code": "HN"
    },
    {
      "name": "Hong Kong",
      "dial_code": "+852",
      "currency_code": "HKD",
      "currency_symbol": "\$",
      "alpha_2_code": "HK"
    },
    {
      "name": "Hungary",
      "dial_code": "+36",
      "currency_code": "HUF",
      "currency_symbol": "Ft",
      "alpha_2_code": "HU"
    },
    {
      "name": "Iceland",
      "dial_code": "+354",
      "currency_code": "ISK",
      "currency_symbol": "kr",
      "alpha_2_code": "IS"
    },
    {
      "name": "India",
      "dial_code": "+91",
      "currency_code": "INR",
      "currency_symbol": "₹",
      "alpha_2_code": "IN"
    },
    {
      "name": "Indonesia",
      "dial_code": "+62",
      "currency_code": "IDR",
      "currency_symbol": "Rp",
      "alpha_2_code": "ID"
    },
    {
      "name": "Iran, Islamic Republic of Persian Gulf",
      "dial_code": "+98",
      "currency_code": "IRR",
      "currency_symbol": "﷼",
      "alpha_2_code": "IR"
    },
    {
      "name": "Iraq",
      "dial_code": "+964",
      "currency_code": "IQD",
      "currency_symbol": "ع.د",
      "alpha_2_code": "IQ"
    },
    {
      "name": "Ireland",
      "dial_code": "+353",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "IE"
    },
    {
      "name": "Israel",
      "dial_code": "+972",
      "currency_code": "ILS",
      "currency_symbol": "₪",
      "alpha_2_code": "IL"
    },
    {
      "name": "Italy",
      "dial_code": "+39",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "IT"
    },
    {
      "name": "Jamaica",
      "dial_code": "+1 876",
      "currency_code": "JMD",
      "currency_symbol": "\$",
      "alpha_2_code": "JM"
    },
    {
      "name": "Japan",
      "dial_code": "+81",
      "currency_code": "JPY",
      "currency_symbol": "¥",
      "alpha_2_code": "JP"
    },
    {
      "name": "Jordan",
      "dial_code": "+962",
      "currency_code": "JOD",
      "currency_symbol": "د.ا",
      "alpha_2_code": "JO"
    },
    {
      "name": "Kazakhstan",
      "dial_code": "+7 7",
      "currency_code": "KZT",
      "currency_symbol": "₸",
      "alpha_2_code": "KZ"
    },
    {
      "name": "Kenya",
      "dial_code": "+254",
      "currency_code": "KES",
      "currency_symbol": "KSh",
      "alpha_2_code": "KE"
    },
    {
      "name": "Kiribati",
      "dial_code": "+686",
      "currency_code": "AUD",
      "currency_symbol": "\$",
      "alpha_2_code": "KI"
    },
    {
      "name": "Korea, Democratic People's Republic of Korea",
      "dial_code": "+850",
      "currency_code": "KPW",
      "currency_symbol": "₩",
      "alpha_2_code": "KP"
    },
    {
      "name": "Korea, Republic of South Korea",
      "dial_code": "+82",
      "currency_code": "KRW",
      "currency_symbol": "₩",
      "alpha_2_code": "KR"
    },
    {
      "name": "Kuwait",
      "dial_code": "+965",
      "currency_code": "KWD",
      "currency_symbol": "د.ك",
      "alpha_2_code": "KW"
    },
    {
      "name": "Kyrgyzstan",
      "dial_code": "+996",
      "currency_code": "KGS",
      "currency_symbol": "som",
      "alpha_2_code": "KG"
    },
    {
      "name": "Lao People's Democratic Republic",
      "dial_code": "+856",
      "currency_code": "LAK",
      "currency_symbol": "₭",
      "alpha_2_code": "LA"
    },
    {
      "name": "Latvia",
      "dial_code": "+371",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "LV"
    },
    {
      "name": "Lebanon",
      "dial_code": "+961",
      "currency_code": "LBP",
      "currency_symbol": "ل.ل",
      "alpha_2_code": "LB"
    },
    {
      "name": "Lesotho",
      "dial_code": "+266",
      "currency_code": "LSL",
      "currency_symbol": "L",
      "alpha_2_code": "LS"
    },
    {
      "name": "Liberia",
      "dial_code": "+231",
      "currency_code": "LRD",
      "currency_symbol": "\$",
      "alpha_2_code": "LR"
    },
    {
      "name": "Libya",
      "dial_code": "+218",
      "currency_code": "LYD",
      "currency_symbol": "ل.د",
      "alpha_2_code": "LY"
    },
    {
      "name": "Liechtenstein",
      "dial_code": "+423",
      "currency_code": "CHF",
      "currency_symbol": "Fr.",
      "alpha_2_code": "LI"
    },
    {
      "name": "Lithuania",
      "dial_code": "+370",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "LT"
    },
    {
      "name": "Luxembourg",
      "dial_code": "+352",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "LU"
    },
    {
      "name": "Macao",
      "dial_code": "+853",
      "currency_code": "MOP",
      "currency_symbol": "MOP\$",
      "alpha_2_code": "MO"
    },
    {
      "name": "Macedonia, Republic of North Macedonia",
      "dial_code": "+389",
      "currency_code": "MKD",
      "currency_symbol": "ден",
      "alpha_2_code": "MK"
    },
    {
      "name": "Madagascar",
      "dial_code": "+261",
      "currency_code": "MGA",
      "currency_symbol": "Ar",
      "alpha_2_code": "MG"
    },
    {
      "name": "Malawi",
      "dial_code": "+265",
      "currency_code": "MWK",
      "currency_symbol": "MK",
      "alpha_2_code": "MW"
    },
    {
      "name": "Malaysia",
      "dial_code": "+60",
      "currency_code": "MYR",
      "currency_symbol": "RM",
      "alpha_2_code": "MY"
    },
    {
      "name": "Maldives",
      "dial_code": "+960",
      "currency_code": "MVR",
      "currency_symbol": "Rf",
      "alpha_2_code": "MV"
    },
    {
      "name": "Mali",
      "dial_code": "+223",
      "currency_code": "XOF",
      "currency_symbol": "CFA",
      "alpha_2_code": "ML"
    },
    {
      "name": "Malta",
      "dial_code": "+356",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "MT"
    },
    {
      "name": "Marshall Islands",
      "dial_code": "+692",
      "currency_code": "USD",
      "currency_symbol": "\$",
      "alpha_2_code": "MH"
    },
    {
      "name": "Martinique",
      "dial_code": "+596",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "MQ"
    },
    {
      "name": "Mauritania",
      "dial_code": "+222",
      "currency_code": "MRO",
      "currency_symbol": "UM",
      "alpha_2_code": "MR"
    },
    {
      "name": "Mauritius",
      "dial_code": "+230",
      "currency_code": "MUR",
      "currency_symbol": "₨",
      "alpha_2_code": "MU"
    },
    {
      "name": "Mayotte",
      "dial_code": "+262",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "YT"
    },
    {
      "name": "Mexico",
      "dial_code": "+52",
      "currency_code": "MXN",
      "currency_symbol": "\$",
      "alpha_2_code": "MX"
    },
    {
      "name": "Micronesia, Federated States of Micronesia",
      "dial_code": "+691",
      "currency_code": "USD",
      "currency_symbol": "\$",
      "alpha_2_code": "FM"
    },
    {
      "name": "Moldova",
      "dial_code": "+373",
      "currency_code": "MDL",
      "currency_symbol": "L",
      "alpha_2_code": "MD"
    },
    {
      "name": "Monaco",
      "dial_code": "+377",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "MC"
    },
    {
      "name": "Mongolia",
      "dial_code": "+976",
      "currency_code": "MNT",
      "currency_symbol": "₮",
      "alpha_2_code": "MN"
    },
    {
      "name": "Montenegro",
      "dial_code": "+382",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "ME"
    },
    {
      "name": "Montserrat",
      "dial_code": "+1664",
      "currency_code": "XCD",
      "currency_symbol": "\$",
      "alpha_2_code": "MS"
    },
    {
      "name": "Morocco",
      "dial_code": "+212",
      "currency_code": "MAD",
      "currency_symbol": "MAD",
      "alpha_2_code": "MA"
    },
    {
      "name": "Mozambique",
      "dial_code": "+258",
      "currency_code": "MZN",
      "currency_symbol": "MT",
      "alpha_2_code": "MZ"
    },
    {
      "name": "Myanmar",
      "dial_code": "+95",
      "currency_code": "MMK",
      "currency_symbol": "K",
      "alpha_2_code": "MM"
    },
    {
      "name": "Namibia",
      "dial_code": "+264",
      "currency_code": "NAD",
      "currency_symbol": "\$",
      "alpha_2_code": "NA"
    },
    {
      "name": "Nauru",
      "dial_code": "+674",
      "currency_code": "AUD",
      "currency_symbol": "\$",
      "alpha_2_code": "NR"
    },
    {
      "name": "Nepal",
      "dial_code": "+977",
      "currency_code": "NPR",
      "currency_symbol": "₨",
      "alpha_2_code": "NP"
    },
    {
      "name": "Netherlands",
      "dial_code": "+31",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "NL"
    },
    {
      "name": "Netherlands Antilles",
      "dial_code": "+599",
      "currency_code": "ANG",
      "currency_symbol": "ƒ",
      "alpha_2_code": "AN"
    },
    {
      "name": "New Caledonia",
      "dial_code": "+687",
      "currency_code": "XPF",
      "currency_symbol": "₣",
      "alpha_2_code": "NC"
    },
    {
      "name": "New Zealand",
      "dial_code": "+64",
      "currency_code": "NZD",
      "currency_symbol": "\$",
      "alpha_2_code": "NZ"
    },
    {
      "name": "Nicaragua",
      "dial_code": "+505",
      "currency_code": "NIO",
      "currency_symbol": "C\$",
      "alpha_2_code": "NI"
    },
    {
      "name": "Niger",
      "dial_code": "+227",
      "currency_code": "XOF",
      "currency_symbol": "CFA",
      "alpha_2_code": "NE"
    },
    {
      "name": "Nigeria",
      "dial_code": "+234",
      "currency_code": "NGN",
      "currency_symbol": "₦",
      "alpha_2_code": "NG"
    },
    {
      "name": "Niue",
      "dial_code": "+683",
      "currency_code": "NZD",
      "currency_symbol": "\$",
      "alpha_2_code": "NU"
    },
    {
      "name": "Norfolk Island",
      "dial_code": "+672",
      "currency_code": "AUD",
      "currency_symbol": "\$",
      "alpha_2_code": "NF"
    },
    {
      "name": "North Korea",
      "dial_code": "+850",
      "currency_code": "KPW",
      "currency_symbol": "₩",
      "alpha_2_code": "KP"
    },
    {
      "name": "Northern Mariana Islands",
      "dial_code": "+1670",
      "currency_code": "USD",
      "currency_symbol": "\$",
      "alpha_2_code": "MP"
    },
    {
      "name": "Norway",
      "dial_code": "+47",
      "currency_code": "NOK",
      "currency_symbol": "kr",
      "alpha_2_code": "NO"
    },
    {
      "name": "Oman",
      "dial_code": "+968",
      "currency_code": "OMR",
      "currency_symbol": "ر.ع.",
      "alpha_2_code": "OM"
    },
    {
      "name": "Pakistan",
      "dial_code": "+92",
      "currency_code": "PKR",
      "currency_symbol": "₨",
      "alpha_2_code": "PK"
    },
    {
      "name": "Palau",
      "dial_code": "+680",
      "currency_code": "USD",
      "currency_symbol": "\$",
      "alpha_2_code": "PW"
    },
    {
      "name": "Palestinian Territory, Occupied",
      "dial_code": "+970",
      "currency_code": "ILS",
      "currency_symbol": "₪",
      "alpha_2_code": "PS"
    },
    {
      "name": "Panama",
      "dial_code": "+507",
      "currency_code": "PAB",
      "currency_symbol": "B/.",
      "alpha_2_code": "PA"
    },
    {
      "name": "Papua New Guinea",
      "dial_code": "+675",
      "currency_code": "PGK",
      "currency_symbol": "K",
      "alpha_2_code": "PG"
    },
    {
      "name": "Paraguay",
      "dial_code": "+595",
      "currency_code": "PYG",
      "currency_symbol": "₲",
      "alpha_2_code": "PY"
    },
    {
      "name": "Peru",
      "dial_code": "+51",
      "currency_code": "PEN",
      "currency_symbol": "S/",
      "alpha_2_code": "PE"
    },
    {
      "name": "Philippines",
      "dial_code": "+63",
      "currency_code": "PHP",
      "currency_symbol": "₱",
      "alpha_2_code": "PH"
    },
    {
      "name": "Pitcairn",
      "dial_code": "+64",
      "currency_code": "NZD",
      "currency_symbol": "\$",
      "alpha_2_code": "PN"
    },
    {
      "name": "Poland",
      "dial_code": "+48",
      "currency_code": "PLN",
      "currency_symbol": "zł",
      "alpha_2_code": "PL"
    },
    {
      "name": "Portugal",
      "dial_code": "+351",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "PT"
    },
    {
      "name": "Puerto Rico",
      "dial_code": "+1939",
      "currency_code": "USD",
      "currency_symbol": "\$",
      "alpha_2_code": "PR"
    },
    {
      "name": "Qatar",
      "dial_code": "+974",
      "currency_code": "QAR",
      "currency_symbol": "ر.ق",
      "alpha_2_code": "QA"
    },
    {
      "name": "Réunion",
      "dial_code": "+262",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "RE"
    },
    {
      "name": "Romania",
      "dial_code": "+40",
      "currency_code": "RON",
      "currency_symbol": "lei",
      "alpha_2_code": "RO"
    },
    {
      "name": "Russia",
      "dial_code": "+7",
      "currency_code": "RUB",
      "currency_symbol": "₽",
      "alpha_2_code": "RU"
    },
    {
      "name": "Rwanda",
      "dial_code": "+250",
      "currency_code": "RWF",
      "currency_symbol": "Fr",
      "alpha_2_code": "RW"
    },
    {
      "name": "Saint Barthélemy",
      "dial_code": "+590",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "BL"
    },
    {
      "name": "Saint Helena, Ascension and Tristan da Cunha",
      "dial_code": "+290",
      "currency_code": "SHP",
      "currency_symbol": "£",
      "alpha_2_code": "SH"
    },
    {
      "name": "Saint Kitts and Nevis",
      "dial_code": "+1869",
      "currency_code": "XCD",
      "currency_symbol": "\$",
      "alpha_2_code": "KN"
    },
    {
      "name": "Saint Lucia",
      "dial_code": "+1758",
      "currency_code": "XCD",
      "currency_symbol": "\$",
      "alpha_2_code": "LC"
    },
    {
      "name": "Saint Martin (French part)",
      "dial_code": "+590",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "MF"
    },
    {
      "name": "Saint Pierre and Miquelon",
      "dial_code": "+508",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "PM"
    },
    {
      "name": "Saint Vincent and the Grenadines",
      "dial_code": "+1784",
      "currency_code": "XCD",
      "currency_symbol": "\$",
      "alpha_2_code": "VC"
    },
    {
      "name": "Samoa",
      "dial_code": "+685",
      "currency_code": "WST",
      "currency_symbol": "SAT",
      "alpha_2_code": "WS"
    },
    {
      "name": "San Marino",
      "dial_code": "+378",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "SM"
    },
    {
      "name": "Sao Tome and Principe",
      "dial_code": "+239",
      "currency_code": "STN",
      "currency_symbol": "Db",
      "alpha_2_code": "ST"
    },
    {
      "name": "Saudi Arabia",
      "dial_code": "+966",
      "currency_code": "SAR",
      "currency_symbol": "ر.س",
      "alpha_2_code": "SA"
    },
    {
      "name": "Senegal",
      "dial_code": "+221",
      "currency_code": "XOF",
      "currency_symbol": "Fr",
      "alpha_2_code": "SN"
    },
    {
      "name": "Serbia",
      "dial_code": "+381",
      "currency_code": "RSD",
      "currency_symbol": "дин.",
      "alpha_2_code": "RS"
    },
    {
      "name": "Seychelles",
      "dial_code": "+248",
      "currency_code": "SCR",
      "currency_symbol": "₨",
      "alpha_2_code": "SC"
    },
    {
      "name": "Sierra Leone",
      "dial_code": "+232",
      "currency_code": "SLL",
      "currency_symbol": "Le",
      "alpha_2_code": "SL"
    },
    {
      "name": "Singapore",
      "dial_code": "+65",
      "currency_code": "SGD",
      "currency_symbol": "\$",
      "alpha_2_code": "SG"
    },
    {
      "name": "Sint Maarten (Dutch part)",
      "dial_code": "+1721",
      "currency_code": "ANG",
      "currency_symbol": "ƒ",
      "alpha_2_code": "SX"
    },
    {
      "name": "Slovakia",
      "dial_code": "+421",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "SK"
    },
    {
      "name": "Slovenia",
      "dial_code": "+386",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "SI"
    },
    {
      "name": "Solomon Islands",
      "dial_code": "+677",
      "currency_code": "SBD",
      "currency_symbol": "SI\$",
      "alpha_2_code": "SB"
    },
    {
      "name": "Somalia",
      "dial_code": "+252",
      "currency_code": "SOS",
      "currency_symbol": "Sh.so.",
      "alpha_2_code": "SO"
    },
    {
      "name": "South Africa",
      "dial_code": "+27",
      "currency_code": "ZAR",
      "currency_symbol": "R",
      "alpha_2_code": "ZA"
    },
    {
      "name": "South Georgia and the South Sandwich Islands",
      "dial_code": "+500",
      "currency_code": "GBP",
      "currency_symbol": "£",
      "alpha_2_code": "GS"
    },
    {
      "name": "South Sudan",
      "dial_code": "+211",
      "currency_code": "SSP",
      "currency_symbol": "£",
      "alpha_2_code": "SS"
    },
    {
      "name": "Spain",
      "dial_code": "+34",
      "currency_code": "EUR",
      "currency_symbol": "€",
      "alpha_2_code": "ES"
    },
    {
      "name": "Sri Lanka",
      "dial_code": "+94",
      "currency_code": "LKR",
      "currency_symbol": "Rs",
      "alpha_2_code": "LK"
    },
    {
      "name": "Sudan",
      "dial_code": "+249",
      "currency_code": "SDG",
      "currency_symbol": "£",
      "alpha_2_code": "SD"
    },
    {
      "name": "Suriname",
      "dial_code": "+597",
      "currency_code": "SRD",
      "currency_symbol": "\$",
      "alpha_2_code": "SR"
    },
    {
      "name": "Svalbard and Jan Mayen",
      "dial_code": "+47",
      "currency_code": "NOK",
      "currency_symbol": "kr",
      "alpha_2_code": "SJ"
    },
    {
      "name": "Swaziland",
      "dial_code": "+268",
      "currency_code": "SZL",
      "currency_symbol": "E",
      "alpha_2_code": "SZ"
    },
    {
      "name": "Sweden",
      "dial_code": "+46",
      "currency_code": "SEK",
      "currency_symbol": "kr",
      "alpha_2_code": "SE"
    },
    {
      "name": "Switzerland",
      "dial_code": "+41",
      "currency_code": "CHF",
      "currency_symbol": "CHF",
      "alpha_2_code": "CH"
    },
    {
      "name": "Syrian Arab Republic",
      "dial_code": "+963",
      "currency_code": "SYP",
      "currency_symbol": "£",
      "alpha_2_code": "SY"
    },
    {
      "name": "Taiwan, Province of China",
      "dial_code": "+886",
      "currency_code": "TWD",
      "currency_symbol": "NT\$",
      "alpha_2_code": "TW"
    },
    {
      "name": "Tajikistan",
      "dial_code": "+992",
      "currency_code": "TJS",
      "currency_symbol": "ЅМ",
      "alpha_2_code": "TJ"
    },
    {
      "name": "Tanzania, United Republic of",
      "dial_code": "+255",
      "currency_code": "TZS",
      "currency_symbol": "Sh",
      "alpha_2_code": "TZ"
    },
    {
      "name": "Thailand",
      "dial_code": "+66",
      "currency_code": "THB",
      "currency_symbol": "฿",
      "alpha_2_code": "TH"
    },
    {
      "name": "Timor-Leste",
      "dial_code": "+670",
      "currency_code": "USD",
      "currency_symbol": "\$",
      "alpha_2_code": "TL"
    },
    {
      "name": "Togo",
      "dial_code": "+228",
      "currency_code": "XOF",
      "currency_symbol": "CFA",
      "alpha_2_code": "TG"
    },
    {
      "name": "Tokelau",
      "dial_code": "+690",
      "currency_code": "NZD",
      "currency_symbol": "\$",
      "alpha_2_code": "TK"
    },
    {
      "name": "Tonga",
      "dial_code": "+676",
      "currency_code": "TOP",
      "currency_symbol": "T\$",
      "alpha_2_code": "TO"
    },
    {
      "name": "Trinidad and Tobago",
      "dial_code": "+1868",
      "currency_code": "TTD",
      "currency_symbol": "TT\$",
      "alpha_2_code": "TT"
    },
    {
      "name": "Tunisia",
      "dial_code": "+216",
      "currency_code": "TND",
      "currency_symbol": "د.ت",
      "alpha_2_code": "TN"
    },
    {
      "name": "Turkey",
      "dial_code": "+90",
      "currency_code": "TRY",
      "currency_symbol": "₺",
      "alpha_2_code": "TR"
    },
    {
      "name": "Turkmenistan",
      "dial_code": "+993",
      "currency_code": "TMT",
      "currency_symbol": "m",
      "alpha_2_code": "TM"
    },
    {
      "name": "Turks and Caicos Islands",
      "dial_code": "+1649",
      "currency_code": "USD",
      "currency_symbol": "\$",
      "alpha_2_code": "TC"
    },
    {
      "name": "Tuvalu",
      "dial_code": "+688",
      "currency_code": "AUD",
      "currency_symbol": "\$",
      "alpha_2_code": "TV"
    },
    {
      "name": "Uganda",
      "dial_code": "+256",
      "currency_code": "UGX",
      "currency_symbol": "USh",
      "alpha_2_code": "UG"
    },
    {
      "name": "Ukraine",
      "dial_code": "+380",
      "currency_code": "UAH",
      "currency_symbol": "₴",
      "alpha_2_code": "UA"
    },
    {
      "name": "United Arab Emirates",
      "dial_code": "+971",
      "currency_code": "AED",
      "currency_symbol": "د.إ",
      "alpha_2_code": "AE"
    },
    {
      "name": "United Kingdom",
      "dial_code": "+44",
      "currency_code": "GBP",
      "currency_symbol": "£",
      "alpha_2_code": "GB"
    },
    {
      "name": "United States",
      "dial_code": "+1",
      "currency_code": "USD",
      "currency_symbol": "\$",
      "alpha_2_code": "US"
    },
    {
      "name": "Uruguay",
      "dial_code": "+598",
      "currency_code": "UYU",
      "currency_symbol": "\$",
      "alpha_2_code": "UY"
    },
    {
      "name": "Uzbekistan",
      "dial_code": "+998",
      "currency_code": "UZS",
      "currency_symbol": "so'm",
      "alpha_2_code": "UZ"
    },
    {
      "name": "Vanuatu",
      "dial_code": "+678",
      "currency_code": "VUV",
      "currency_symbol": "VT",
      "alpha_2_code": "VU"
    },
    {
      "name": "Venezuela, Bolivarian Republic of",
      "dial_code": "+58",
      "currency_code": "VES",
      "currency_symbol": "Bs.",
      "alpha_2_code": "VE"
    },
    {
      "name": "Vietnam",
      "dial_code": "+84",
      "currency_code": "VND",
      "currency_symbol": "₫",
      "alpha_2_code": "VN"
    },
    {
      "name": "Virgin Islands, British",
      "dial_code": "+1284",
      "currency_code": "USD",
      "currency_symbol": "\$",
      "alpha_2_code": "VG"
    },
    {
      "name": "Virgin Islands, U.S.",
      "dial_code": "+1340",
      "currency_code": "USD",
      "currency_symbol": "\$",
      "alpha_2_code": "VI"
    },
    {
      "name": "Wallis and Futuna",
      "dial_code": "+681",
      "currency_code": "XPF",
      "currency_symbol": "₣",
      "alpha_2_code": "WF"
    },
    {
      "name": "Yemen",
      "dial_code": "+967",
      "currency_code": "YER",
      "currency_symbol": "﷼",
      "alpha_2_code": "YE"
    },
    {
      "name": "Zambia",
      "dial_code": "+260",
      "currency_code": "ZMW",
      "currency_symbol": "ZK",
      "alpha_2_code": "ZM"
    },
    {
      "name": "Zimbabwe",
      "dial_code": "+263",
      "currency_code": "ZWL",
      "currency_symbol": "\$",
      "alpha_2_code": "ZW"
    }
  ]
  ''';
  final List<dynamic> listCountriesData = json.decode(jsonString);
  if (name == null) {
    return listCountriesData;
  } else {
    return listCountriesData
        .where(
            (names) => names['name'].toLowerCase().contains(name.toLowerCase()))
        .toList();
  }
}

List<String> listOfCountries() {
  // list of all countries in the world
  return [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo, Democratic Republic of the',
    'Congo, Republic of the',
    'Costa Rica',
    'Cote d\'Ivoire',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czech Republic (Czechia)',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini (formerly Swaziland)',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Kosovo',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Myanmar',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North Korea',
    'North Macedonia',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Palestine',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Vincent and the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Korea',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Syria',
    'Taiwan',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Timor-Leste (East Timor)',
    'Togo',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Vatican City',
    'Venezuela',
    'Vietnam',
    'Yemen',
    'Zambia',
    'Zimbabwe'
  ];
}

List<String>? listOfCurrencies() {
  // list out 10 country currency code and name
  return [
    "AFN",
    "ALL",
    "DZD",
    "EUR",
    "AOA",
    "XCD",
    "ARS",
    "AMD",
    "AWG",
    "AUD",
    "AZN",
    "BSD",
    "BHD",
    "BDT",
    "BBD",
    "BYN",
    "BZD",
    "BMD",
    "BTN",
    "BOB",
    "BAM",
    "BWP",
    "BRL",
    "GBP",
    "BND",
    "BGN",
    "XOF",
    "BIF",
    "KHR",
    "CAD",
    "CVE",
    "KYD",
    "XAF",
    "CLP",
    "CNY",
    "COP",
    "KMF",
    "CDF",
    "CRC",
    "HRK",
    "CUP",
    "ANG",
    "CZK",
    "DKK",
    "DJF",
    "DOP",
    "EGP",
    "ERN",
    "ETB",
    "FKP",
    "FJD",
    "GMD",
    "GEL",
    "GHS",
    "GIP",
    "GTQ",
    "GGP",
    "GNF",
    "GYD",
    "HTG",
    "HNL",
    "HKD",
    "HUF",
    "ISK",
    "INR",
    "IDR",
    "IRR",
    "IQD",
    "ILS",
    "IMP",
    "JMD",
    "JPY",
    "JEP",
    "JOD",
    "KZT",
    "KES",
    "KPW",
    "KRW",
    "KWD",
    "KGU",
    "LAK",
    "LBP",
    "LSL",
    "LRD",
    "LYD",
    "MOP",
    "MKD",
    "MGA",
    "MWK",
    "MYR",
    "MVR",
    "MRO",
    "MUR",
    "MXN",
    "MDL",
    "MNT",
    "MAD",
    "MZM",
    "MMK",
    "NAD",
    "NPR",
    "NIO",
    "NGN",
    "NOK",
    "OMR",
    "PKR",
    "PAB",
    "PGK",
    "PYG",
    "PEN",
    "PHP",
    "PLN",
    "QAR",
    "RON",
    "RUB",
    "RWF",
    "SHP",
    "WST",
    "SAR",
    "RSD",
    "SCR",
    "SLL",
    "SGD",
    "SBD",
    "SOS",
    "ZAR",
    "SSP",
    "LKR",
    "SDG",
    "SRD",
    "SEK",
    "CHF",
    "SYP",
    "TWD",
    "TJS",
    "TZS",
    "THB",
    "TOP",
    "TTD",
    "TND",
    "TRY",
    "TMT",
    "UGX",
    "UAH",
    "AED",
    "USD",
    "UYU",
    "UZS",
    "VUV",
    "VES",
    "VND",
    "YER",
    "ZMW",
    "ZWL"
  ];
}

String? listAlphabeticallyOrder(String? name) {
  // list Alphabetically Order
  if (name == null) {
    return null;
  }
  List<String> list = name.split('');
  list.sort();
  return list.join();
}

List<String>? listOfStrings(List<String> numberOfLists) {
  // write a function to list out strings
  if (numberOfLists == null || numberOfLists.isEmpty) {
    return null;
  }
  final List<String> result = [];
  for (final list in numberOfLists) {
    result.addAll(list.split(' '));
  }
  return result;
}

double? sumOfNumbers(List<double>? listOfDouble) {
  // Get the sum of a given integer or double and return 0 if empty
  if (listOfDouble == null || listOfDouble.isEmpty) {
    return 0.0;
  }
  return listOfDouble.reduce((a, b) => a + b);
}

String? allFirstLetterUpperCase(String? name) {
  if (name == null) {
    return null;
  }

  List<String> words = name.split(' ');
  List<String> newWords = [];

  for (String word in words) {
    if (word.isEmpty) {
      newWords.add(word); // Skip empty words
    } else {
      String firstLetter = word[0].toUpperCase();
      String restOfWord = word.substring(1).toLowerCase();
      newWords.add(firstLetter + restOfWord);
    }
  }

  return newWords.join(' ');
}

List<String> listOnlyCountriesWithDialCode() {
  // List of countries in the world with their country dial codes
  return [
    'Afghanistan (+93)',
    'Albania (+355)',
    'Algeria (+213)',
    'Andorra (+376)',
    'Angola (+244)',
    'Antigua and Barbuda (+1-268)',
    'Argentina (+54)',
    'Armenia (+374)',
    'Australia (+61)',
    'Austria (+43)',
    'Azerbaijan (+994)',
    'Bahamas (+1-242)',
    'Bahrain (+973)',
    'Bangladesh (+880)',
    'Barbados (+1-246)',
    'Belarus (+375)',
    'Belgium (+32)',
    'Belize (+501)',
    'Benin (+229)',
    'Bhutan (+975)',
    'Bolivia (+591)',
    'Bosnia and Herzegovina (+387)',
    'Botswana (+267)',
    'Brazil (+55)',
    'Brunei (+673)',
    'Bulgaria (+359)',
    'Burkina Faso (+226)',
    'Burundi (+257)',
    'Cabo Verde (+238)',
    'Cambodia (+855)',
    'Cameroon (+237)',
    'Canada (+1)',
    'Central African Republic (CAR) (+236)',
    'Chad (+235)',
    'Chile (+56)',
    'China (+86)',
    'Colombia (+57)',
    'Comoros (+269)',
    'Congo, Democratic Republic of the (+243)',
    'Congo, Republic of the (+242)',
    'Costa Rica (+506)',
    'Cote d\'Ivoire (+225)',
    'Croatia (+385)',
    'Cuba (+53)',
    'Cyprus (+357)',
    'Czech Republic (Czechia) (+420)',
    'Denmark (+45)',
    'Djibouti (+253)',
    'Dominica (+1-767)',
    'Dominican Republic (+1-809)',
    'Ecuador (+593)',
    'Egypt (+20)',
    'El Salvador (+503)',
    'Equatorial Guinea (+240)',
    'Eritrea (+291)',
    'Estonia (+372)',
    'Eswatini (formerly Swaziland) (+268)',
    'Ethiopia (+251)',
    'Fiji (+679)',
    'Finland (+358)',
    'France (+33)',
    'Gabon (+241)',
    'Gambia (+220)',
    'Georgia (+995)',
    'Germany (+49)',
    'Ghana (+233)',
    'Greece (+30)',
    'Grenada (+1-473)',
    'Guatemala (+502)',
    'Guinea (+224)',
    'Guinea-Bissau (+245)',
    'Guyana (+592)',
    'Haiti (+509)',
    'Honduras (+504)',
    'Hungary (+36)',
    'Iceland (+354)',
    'India (+91)',
    'Indonesia (+62)',
    'Iran (+98)',
    'Iraq (+964)',
    'Ireland (+353)',
    'Israel (+972)',
    'Italy (+39)',
    'Jamaica (+1-876)',
    'Japan (+81)',
    'Jordan (+962)',
    'Kazakhstan (+7)',
    'Kenya (+254)',
    'Kiribati (+686)',
    'Kosovo (+383)',
    'Kuwait (+965)',
    'Kyrgyzstan (+996)',
    'Laos (+856)',
    'Latvia (+371)',
    'Lebanon (+961)',
    'Lesotho (+266)',
    'Liberia (+231)',
    'Libya (+218)',
    'Liechtenstein (+423)',
    'Lithuania (+370)',
    'Luxembourg (+352)',
    'Madagascar (+261)',
    'Malawi (+265)',
    'Malaysia (+60)',
    'Maldives (+960)',
    'Mali (+223)',
    'Malta (+356)',
    'Marshall Islands (+692)',
    'Mauritania (+222)',
    'Mauritius (+230)',
    'Mexico (+52)',
    'Micronesia (+691)',
    'Moldova (+373)',
    'Monaco (+377)',
    'Mongolia (+976)',
    'Montenegro (+382)',
    'Morocco (+212)',
    'Mozambique (+258)',
    'Myanmar (formerly Burma) (+95)',
    'Namibia (+264)',
    'Nauru (+674)',
    'Nepal (+977)',
    'Netherlands (+31)',
    'New Zealand (+64)',
    'Nicaragua (+505)',
    'Niger (+227)',
    'Nigeria (+234)',
    'North Korea (+850)',
    'North Macedonia (formerly Macedonia) (+389)',
    'Norway (+47)',
    'Oman (+968)',
    'Pakistan (+92)',
    'Palau (+680)',
    'Palestine (+970)',
    'Panama (+507)',
    'Papua New Guinea (+675)',
    'Paraguay (+595)',
    'Peru (+51)',
    'Philippines (+63)',
    'Poland (+48)',
    'Portugal (+351)',
    'Qatar (+974)',
    'Romania (+40)',
    'Russia (+7)',
    'Rwanda (+250)',
    'Saint Kitts and Nevis (+1-869)',
    'Saint Lucia (+1-758)',
    'Saint Vincent and the Grenadines (+1-784)',
    'Samoa (+685)',
    'San Marino (+378)',
    'Sao Tome and Principe (+239)',
    'Saudi Arabia (+966)',
    'Senegal (+221)',
    'Serbia (+381)',
    'Seychelles (+248)',
    'Sierra Leone (+232)',
    'Singapore (+65)',
    'Slovakia (+421)',
    'Slovenia (+386)',
    'Solomon Islands (+677)',
    'Somalia (+252)',
    'South Africa (+27)',
    'South Korea (+82)',
    'South Sudan (+211)',
    'Spain (+34)',
    'Sri Lanka (+94)',
    'Sudan (+249)',
    'Suriname (+597)',
    'Sweden (+46)',
    'Switzerland (+41)',
    'Syria (+963)',
    'Taiwan (+886)',
    'Tajikistan (+992)',
    'Tanzania (+255)',
    'Thailand (+66)',
    'Timor-Leste (East Timor) (+670)',
    'Togo (+228)',
    'Tonga (+676)',
    'Trinidad and Tobago (+1-868)',
    'Tunisia (+216)',
    'Turkey (+90)',
    'Turkmenistan (+993)',
    'Tuvalu (+688)',
    'Uganda (+256)',
    'Ukraine (+380)',
    'United Arab Emirates (UAE) (+971)',
    'United Kingdom (UK) (+44)',
    'United States of America (USA) (+1)',
    'Uruguay (+598)',
    'Uzbekistan (+998)',
    'Vanuatu (+678)',
    'Vatican City (Holy See) (+379)',
    'Venezuela (+58)',
    'Vietnam (+84)',
    'Yemen (+967)',
    'Zambia (+260)',
    'Zimbabwe (+263)'
  ];
}

List<String> listOnlyCountriesDialCode() {
  // List of country dial codes
  return [
    '+93',
    '+355',
    '+213',
    '+376',
    '+244',
    '+1-268',
    '+54',
    '+374',
    '+61',
    '+43',
    '+994',
    '+1-242',
    '+973',
    '+880',
    '+1-246',
    '+375',
    '+32',
    '+501',
    '+229',
    '+975',
    '+591',
    '+387',
    '+267',
    '+55',
    '+673',
    '+359',
    '+226',
    '+257',
    '+238',
    '+855',
    '+237',
    '+1',
    '+236',
    '+235',
    '+56',
    '+86',
    '+57',
    '+269',
    '+243',
    '+242',
    '+506',
    '+225',
    '+385',
    '+53',
    '+357',
    '+420',
    '+45',
    '+253',
    '+1-767',
    '+1-809',
    '+593',
    '+20',
    '+503',
    '+240',
    '+291',
    '+372',
    '+268',
    '+251',
    '+679',
    '+358',
    '+33',
    '+241',
    '+220',
    '+995',
    '+49',
    '+233',
    '+30',
    '+1-473',
    '+502',
    '+224',
    '+245',
    '+592',
    '+509',
    '+504',
    '+36',
    '+354',
    '+91',
    '+62',
    '+98',
    '+964',
    '+353',
    '+972',
    '+39',
    '+1-876',
    '+81',
    '+962',
    '+7',
    '+254',
    '+686',
    '+383',
    '+965',
    '+996',
    '+856',
    '+371',
    '+961',
    '+266',
    '+231',
    '+218',
    '+423',
    '+370',
    '+352',
    '+261',
    '+265',
    '+60',
    '+960',
    '+223',
    '+356',
    '+692',
    '+222',
    '+230',
    '+52',
    '+691',
    '+373',
    '+377',
    '+976',
    '+382',
    '+212',
    '+258',
    '+95',
    '+264',
    '+674',
    '+977',
    '+31',
    '+64',
    '+505',
    '+227',
    '+234',
    '+850',
    '+389',
    '+47',
    '+968',
    '+92',
    '+680',
    '+970',
    '+507',
    '+675',
    '+595',
    '+51',
    '+63',
    '+48',
    '+351',
    '+974',
    '+40',
    '+7',
    '+250',
    '+1-869',
    '+1-758',
    '+1-784',
    '+685',
    '+378',
    '+239',
    '+966',
    '+221',
    '+381',
    '+248',
    '+232',
    '+65',
    '+421',
    '+386',
    '+677',
    '+252',
    '+27',
    '+82',
    '+211',
    '+34',
    '+94',
    '+249',
    '+597',
    '+46',
    '+41',
    '+963',
    '+886',
    '+992',
    '+255',
    '+66',
    '+670',
    '+228',
    '+676',
    '+1-868',
    '+216',
    '+90',
    '+993',
    '+688',
    '+256',
    '+380',
    '+971',
    '+44',
    '+1',
    '+598',
    '+998',
    '+678',
    '+379',
    '+58',
    '+84',
    '+967',
    '+260',
    '+263'
  ];
}

List<int> listOfNumbers(String? numberOfLists) {
  // write a funtion to list numbers
  int numberOfListsInt = int.parse(numberOfLists ?? '0');
  List<int> listOfNumbers = [];
  for (int i = 0; i < numberOfListsInt; i++) {
    listOfNumbers.add(i);
  }
  return listOfNumbers;
}

String? uUIDReference() {
  // Generate a UUID for me
  var rng = math.Random();
  var codeUnits = List<int>.generate(16, (index) {
    final value = rng.nextInt(255);
    if (index == 6) {
      return value & 0x0f | 0x40; // version 4
    } else if (index == 8) {
      return value & 0x3f | 0x80; // variant 10
    } else {
      return value;
    }
  });

  var hexString =
      codeUnits.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();

  return hexString;
}

String? readableUnixTimestamp(String? output) {
  // I need unix timestamp to human readable
  if (output == null) return null;
  final int unixTimestamp = int.tryParse(output) ?? 0;
  final DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
  final DateFormat formatter = DateFormat('MMM d, yyyy h:mm a');
  return formatter.format(dateTime);
}

String? getDomainUrl() {
  // Path to be appended to the domain URL
  String path = "/homepage";

  // Combine the domain URL and the modified path
  String domainUrl = Uri.base.origin + path;

  // Return the updated domain URL
  return domainUrl;
}

bool? indexChecker(
  int? indexList,
  int? lengthOfList,
) {
  // if indexList<lengthOfList return true. else return false
  if (indexList != null && lengthOfList != null && indexList < lengthOfList) {
    return true;
  } else {
    return false;
  }
}
