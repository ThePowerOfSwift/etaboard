// generated
import Foundation
func distanceBetweenUInt16Chars(codeA: CharacterCode, and codeB: CharacterCode) -> Distance {
if codeA == codeB { return 0 }
if codeA > codeB { return distanceBetweenUInt16Chars(codeB, and: codeA) }
switch (codeA) {
case 72:  // H
    switch (codeB) {
    case 72: return 0.0  // H
    case 86: return 0.14844254188022  // V
    case 78: return 0.0899664937848628  // N
    case 84: return 0.14844254188022  // T
    case 85: return 0.0899664937848628  // U
    case 74: return 0.0875652329966384  // J
    case 73: return 0.141894725151684  // I
    case 77: return 0.141894725151684  // M
    case 90: return 0.0934219553527868  // Z
    case 104: return 0.05  // h
    default: return 1
    }
case 119:  // w
    switch (codeB) {
    case 119: return 0.0  // w
    default: return 1
    }
case 120:  // x
    switch (codeB) {
    case 121: return 0.0796047572696713  // y
    case 120: return 0.0  // x
    default: return 1
    }
case 83:  // S
    switch (codeB) {
    case 88: return 0.106720040486886  // X
    case 115: return 0.05  // s
    case 87: return 0.0833865988966355  // W
    case 83: return 0.06  // S
    case 89: return 0.0833865988966354  // Y
    default: return 1
    }
case 65:  // A
    switch (codeB) {
    case 196: return 0.06  // Ä
    case 192: return 0.06  // À
    case 65: return 0.0  // A
    case 97: return 0.05  // a
    case 194: return 0.06  // Â
    case 89: return 0.111936643553021  // Y
    case 193: return 0.06  // Á
    case 87: return 0.111936643553021  // W
    case 197: return 0.06  // Å
    case 83: return 0.0875652329966384  // S
    case 81: return 0.0826231597552956  // Q
    default: return 1
    }
case 67:  // C
    switch (codeB) {
    case 88: return 0.0796047572696712  // X
    case 86: return 0.0796047572696713  // V
    case 67: return 0.0  // C
    case 68: return 0.101859021498974  // D
    case 99: return 0.05  // c
    case 71: return 0.141894725151684  // G
    case 70: return 0.087103482212508  // F
    default: return 1
    }
case 114:  // r
    switch (codeB) {
    case 114: return 0.0  // r
    case 116: return 0.0796047572696713  // t
    default: return 1
    }
case 99:  // c
    switch (codeB) {
    case 102: return 0.087103482212508  // f
    case 118: return 0.0796047572696713  // v
    case 103: return 0.141894725151684  // g
    case 120: return 0.0796047572696712  // x
    case 100: return 0.101859021498974  // d
    case 99: return 0.0  // c
    default: return 1
    }
case 82:  // R
    switch (codeB) {
    case 82: return 0.0  // R
    case 84: return 0.0796047572696713  // T
    case 114: return 0.05  // r
    default: return 1
    }
case 101:  // e
    switch (codeB) {
    case 119: return 0.0796047572696713  // w
    case 114: return 0.0796047572696712  // r
    case 233: return 0.06  // é
    case 101: return 0.0  // e
    case 102: return 0.135498251499723  // f
    case 115: return 0.106720040486886  // s
    case 232: return 0.06  // è
    case 234: return 0.06  // ê
    default: return 1
    }
case 71:  // G
    switch (codeB) {
    case 72: return 0.0875652329966384  // H
    case 86: return 0.0899664937848628  // V
    case 78: return 0.14844254188022  // N
    case 84: return 0.0899664937848628  // T
    case 85: return 0.14844254188022  // U
    case 82: return 0.141894725151684  // R
    case 71: return 0.0  // G
    case 103: return 0.05  // g
    case 90: return 0.0934219553527868  // Z
    default: return 1
    }
case 69:  // E
    switch (codeB) {
    case 201: return 0.06  // É
    case 200: return 0.06  // È
    case 202: return 0.06  // Ê
    case 82: return 0.0796047572696712  // R
    case 101: return 0.05  // e
    case 87: return 0.0796047572696713  // W
    case 70: return 0.135498251499723  // F
    case 83: return 0.106720040486886  // S
    case 69: return 0.0  // E
    default: return 1
    }
case 106:  // j
    switch (codeB) {
    case 111: return 0.135498251499723  // o
    case 106: return 0.0  // j
    case 117: return 0.0974068366570524  // u
    case 107: return 0.0875652329966384  // k
    case 109: return 0.087103482212508  // m
    case 110: return 0.0974068366570524  // n
    default: return 1
    }
case 86:  // V
    switch (codeB) {
    case 118: return 0.05  // v
    case 86: return 0.0  // V
    default: return 1
    }
case 112:  // p
    switch (codeB) {
    case 112: return 0.0  // p
    default: return 1
    }
case 66:  // B
    switch (codeB) {
    case 72: return 0.0934219553527867  // H
    case 66: return 0.0  // B
    case 71: return 0.0934219553527867  // G
    case 86: return 0.0796047572696713  // V
    case 78: return 0.0796047572696712  // N
    case 98: return 0.05  // b
    default: return 1
    }
case 75:  // K
    switch (codeB) {
    case 76: return 0.0875652329966384  // L
    case 79: return 0.0848928829216378  // O
    case 75: return 0.0  // K
    case 77: return 0.101859021498974  // M
    case 80: return 0.129275587953379  // P
    case 107: return 0.05  // k
    default: return 1
    }
case 111:  // o
    switch (codeB) {
    case 248: return 0.06  // ø
    case 111: return 0.0  // o
    case 246: return 0.06  // ö
    case 112: return 0.0796047572696713  // p
    default: return 1
    }
case 87:  // W
    switch (codeB) {
    case 87: return 0.0  // W
    case 119: return 0.05  // w
    default: return 1
    }
case 122:  // z
    switch (codeB) {
    case 122: return 0.0  // z
    default: return 1
    }
case 105:  // i
    switch (codeB) {
    case 111: return 0.0796047572696712  // o
    case 106: return 0.087103482212508  // j
    case 105: return 0.0  // i
    case 107: return 0.101859021498974  // k
    case 117: return 0.0796047572696713  // u
    default: return 1
    }
case 84:  // T
    switch (codeB) {
    case 84: return 0.0  // T
    case 90: return 0.0796047572696713  // Z
    case 116: return 0.05  // t
    default: return 1
    }
case 108:  // l
    switch (codeB) {
    case 111: return 0.106720040486886  // o
    case 112: return 0.0833865988966355  // p
    case 108: return 0.0  // l
    default: return 1
    }
case 80:  // P
    switch (codeB) {
    case 80: return 0.0  // P
    case 112: return 0.05  // p
    default: return 1
    }
case 88:  // X
    switch (codeB) {
    case 88: return 0.0  // X
    case 120: return 0.05  // x
    case 89: return 0.0796047572696713  // Y
    default: return 1
    }
case 68:  // D
    switch (codeB) {
    case 88: return 0.0848928829216377  // X
    case 68: return 0.0  // D
    case 89: return 0.129275587953379  // Y
    case 82: return 0.101859021498974  // R
    case 87: return 0.129275587953379  // W
    case 70: return 0.0875652329966384  // F
    case 100: return 0.05  // d
    case 83: return 0.0875652329966384  // S
    case 69: return 0.0848928829216378  // E
    default: return 1
    }
case 110:  // n
    switch (codeB) {
    case 110: return 0.0  // n
    default: return 1
    }
case 74:  // J
    switch (codeB) {
    case 106: return 0.05  // j
    case 78: return 0.0974068366570524  // N
    case 85: return 0.0974068366570524  // U
    case 74: return 0.0  // J
    case 79: return 0.135498251499723  // O
    case 75: return 0.0875652329966384  // K
    case 77: return 0.087103482212508  // M
    default: return 1
    }
case 117:  // u
    switch (codeB) {
    case 249: return 0.06  // ù
    case 117: return 0.0  // u
    case 252: return 0.06  // ü
    case 251: return 0.06  // û
    case 122: return 0.0796047572696712  // z
    case 250: return 0.06  // ú
    default: return 1
    }
case 73:  // I
    switch (codeB) {
    case 74: return 0.087103482212508  // J
    case 79: return 0.0796047572696712  // O
    case 73: return 0.0  // I
    case 75: return 0.101859021498974  // K
    case 105: return 0.05  // i
    case 85: return 0.0796047572696713  // U
    default: return 1
    }
case 77:  // M
    switch (codeB) {
    case 78: return 0.0796047572696713  // N
    case 109: return 0.05  // m
    case 77: return 0.0  // M
    default: return 1
    }
case 113:  // q
    switch (codeB) {
    case 113: return 0.0  // q
    case 115: return 0.123253062718541  // s
    case 119: return 0.0796047572696712  // w
    default: return 1
    }
case 118:  // v
    switch (codeB) {
    case 118: return 0.0  // v
    default: return 1
    }
case 90:  // Z
    switch (codeB) {
    case 90: return 0.0  // Z
    case 122: return 0.05  // z
    default: return 1
    }
case 98:  // b
    switch (codeB) {
    case 98: return 0.0  // b
    case 118: return 0.0796047572696713  // v
    case 103: return 0.0934219553527867  // g
    case 104: return 0.0934219553527867  // h
    case 110: return 0.0796047572696712  // n
    default: return 1
    }
case 78:  // N
    switch (codeB) {
    case 78: return 0.0  // N
    case 110: return 0.05  // n
    default: return 1
    }
case 89:  // Y
    switch (codeB) {
    case 121: return 0.05  // y
    case 89: return 0.0  // Y
    default: return 1
    }
case 121:  // y
    switch (codeB) {
    case 121: return 0.0  // y
    default: return 1
    }
case 104:  // h
    switch (codeB) {
    case 106: return 0.0875652329966384  // j
    case 105: return 0.141894725151684  // i
    case 109: return 0.141894725151684  // m
    case 110: return 0.0899664937848628  // n
    case 117: return 0.0899664937848628  // u
    case 118: return 0.14844254188022  // v
    case 116: return 0.14844254188022  // t
    case 104: return 0.0  // h
    case 122: return 0.0934219553527868  // z
    default: return 1
    }
case 85:  // U
    switch (codeB) {
    case 218: return 0.06  // Ú
    case 217: return 0.06  // Ù
    case 85: return 0.0  // U
    case 117: return 0.05  // u
    case 220: return 0.06  // Ü
    case 219: return 0.06  // Û
    case 90: return 0.0796047572696712  // Z
    default: return 1
    }
case 76:  // L
    switch (codeB) {
    case 76: return 0.0  // L
    case 79: return 0.106720040486886  // O
    case 108: return 0.05  // l
    case 80: return 0.0833865988966355  // P
    default: return 1
    }
case 102:  // f
    switch (codeB) {
    case 102: return 0.0  // f
    case 118: return 0.0974068366570523  // v
    case 103: return 0.0875652329966384  // g
    case 114: return 0.087103482212508  // r
    case 116: return 0.0974068366570524  // t
    case 120: return 0.135498251499723  // x
    default: return 1
    }
case 79:  // O
    switch (codeB) {
    case 214: return 0.06  // Ö
    case 79: return 0.0  // O
    case 111: return 0.05  // o
    case 80: return 0.0796047572696713  // P
    case 216: return 0.06  // Ø
    default: return 1
    }
case 70:  // F
    switch (codeB) {
    case 88: return 0.135498251499723  // X
    case 86: return 0.0974068366570523  // V
    case 84: return 0.0974068366570524  // T
    case 82: return 0.087103482212508  // R
    case 71: return 0.0875652329966384  // G
    case 102: return 0.05  // f
    case 70: return 0.0  // F
    default: return 1
    }
case 107:  // k
    switch (codeB) {
    case 111: return 0.0848928829216378  // o
    case 108: return 0.0875652329966384  // l
    case 107: return 0.0  // k
    case 109: return 0.101859021498974  // m
    case 112: return 0.129275587953379  // p
    default: return 1
    }
case 100:  // d
    switch (codeB) {
    case 119: return 0.129275587953379  // w
    case 114: return 0.101859021498974  // r
    case 101: return 0.0848928829216378  // e
    case 102: return 0.0875652329966384  // f
    case 115: return 0.0875652329966384  // s
    case 120: return 0.0848928829216377  // x
    case 100: return 0.0  // d
    case 121: return 0.129275587953379  // y
    default: return 1
    }
case 116:  // t
    switch (codeB) {
    case 116: return 0.0  // t
    case 122: return 0.0796047572696713  // z
    default: return 1
    }
case 97:  // a
    switch (codeB) {
    case 97: return 0.0  // a
    case 119: return 0.111936643553021  // w
    case 225: return 0.06  // á
    case 228: return 0.06  // ä
    case 226: return 0.06  // â
    case 224: return 0.06  // à
    case 115: return 0.0875652329966384  // s
    case 229: return 0.06  // å
    case 113: return 0.0826231597552956  // q
    case 121: return 0.111936643553021  // y
    default: return 1
    }
case 109:  // m
    switch (codeB) {
    case 109: return 0.0  // m
    case 110: return 0.0796047572696713  // n
    default: return 1
    }
case 115:  // s
    switch (codeB) {
    case 115: return 0.0  // s
    case 120: return 0.106720040486886  // x
    case 119: return 0.0833865988966355  // w
    case 121: return 0.0833865988966354  // y
    case 223: return 0.06  // ß
    default: return 1
    }
case 103:  // g
    switch (codeB) {
    case 114: return 0.141894725151684  // r
    case 110: return 0.14844254188022  // n
    case 117: return 0.14844254188022  // u
    case 118: return 0.0899664937848628  // v
    case 103: return 0.0  // g
    case 116: return 0.0899664937848628  // t
    case 104: return 0.0875652329966384  // h
    case 122: return 0.0934219553527868  // z
    default: return 1
    }
case 81:  // Q
    switch (codeB) {
    case 87: return 0.0796047572696712  // W
    case 113: return 0.05  // q
    case 83: return 0.123253062718541  // S
    case 81: return 0.0  // Q
    default: return 1
    }
default: return 1
}
}
