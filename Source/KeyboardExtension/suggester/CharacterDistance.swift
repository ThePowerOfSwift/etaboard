// generated
import Foundation
func distanceBetweenUInt16Chars(codeA: CharacterCode, and codeB: CharacterCode) -> Distance {
if codeA == codeB { return 0 }
if codeA > codeB { return distanceBetweenUInt16Chars(codeB, and: codeA) }
switch (codeA) {
case 72:  // H
    switch (codeB) {
    case 72: return 0.0  // H
    case 78: return 0.0947639998412172  // N
    case 85: return 0.0947639998412172  // U
    case 74: return 0.0899642804759983  // J
    case 73: return 0.147272298828553  // I
    case 77: return 0.147272298828553  // M
    case 90: return 0.0982298625374924  // Z
    case 104: return 0.01  // h
    default: return 1
    }
case 119:  // w
    switch (codeB) {
    case 119: return 0.0  // w
    default: return 1
    }
case 120:  // x
    switch (codeB) {
    case 121: return 0.0817857095236349  // y
    case 120: return 0.0  // x
    default: return 1
    }
case 83:  // S
    switch (codeB) {
    case 88: return 0.111617403896946  // X
    case 115: return 0.01  // s
    case 87: return 0.0881828399128482  // W
    case 83: return 0.02  // S
    case 89: return 0.0881828399128482  // Y
    default: return 1
    }
case 65:  // A
    switch (codeB) {
    case 196: return 0.02  // Ä
    case 192: return 0.02  // À
    case 65: return 0.0  // A
    case 97: return 0.01  // a
    case 194: return 0.02  // Â
    case 89: return 0.116886471687297  // Y
    case 193: return 0.02  // Á
    case 87: return 0.116886471687297  // W
    case 83: return 0.0899642804759983  // S
    case 81: return 0.0874210226973429  // Q
    default: return 1
    }
case 67:  // C
    switch (codeB) {
    case 88: return 0.0817857095236349  // X
    case 86: return 0.0817857095236349  // V
    case 67: return 0.0  // C
    case 68: return 0.106715605641952  // D
    case 99: return 0.01  // c
    case 71: return 0.147272298828553  // G
    case 70: return 0.0918972441552164  // F
    default: return 1
    }
case 114:  // r
    switch (codeB) {
    case 114: return 0.0  // r
    case 116: return 0.0817857095236349  // t
    default: return 1
    }
case 99:  // c
    switch (codeB) {
    case 102: return 0.0918972441552164  // f
    case 118: return 0.0817857095236349  // v
    case 103: return 0.147272298828553  // g
    case 120: return 0.0817857095236349  // x
    case 100: return 0.106715605641952  // d
    case 99: return 0.0  // c
    default: return 1
    }
case 82:  // R
    switch (codeB) {
    case 82: return 0.0  // R
    case 84: return 0.0817857095236349  // T
    case 114: return 0.01  // r
    default: return 1
    }
case 101:  // e
    switch (codeB) {
    case 101: return 0.0  // e
    case 102: return 0.140770157928472  // f
    case 115: return 0.111617403896947  // s
    case 114: return 0.0817857095236349  // r
    case 119: return 0.0817857095236349  // w
    default: return 1
    }
case 71:  // G
    switch (codeB) {
    case 72: return 0.0899642804759983  // H
    case 86: return 0.0947639998412171  // V
    case 84: return 0.0947639998412172  // T
    case 82: return 0.147272298828553  // R
    case 71: return 0.0  // G
    case 103: return 0.01  // g
    case 90: return 0.0982298625374924  // Z
    default: return 1
    }
case 69:  // E
    switch (codeB) {
    case 82: return 0.0817857095236349  // R
    case 101: return 0.01  // e
    case 87: return 0.0817857095236349  // W
    case 70: return 0.140770157928472  // F
    case 83: return 0.111617403896947  // S
    case 69: return 0.0  // E
    default: return 1
    }
case 106:  // j
    switch (codeB) {
    case 111: return 0.140770157928472  // o
    case 106: return 0.0  // j
    case 117: return 0.102233918872401  // u
    case 107: return 0.0899642804759983  // k
    case 109: return 0.0918972441552164  // m
    case 110: return 0.102233918872401  // n
    default: return 1
    }
case 86:  // V
    switch (codeB) {
    case 118: return 0.01  // v
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
    case 72: return 0.0982298625374923  // H
    case 66: return 0.0  // B
    case 71: return 0.0982298625374923  // G
    case 86: return 0.0817857095236348  // V
    case 78: return 0.0817857095236349  // N
    case 98: return 0.01  // b
    default: return 1
    }
case 75:  // K
    switch (codeB) {
    case 76: return 0.0899642804759983  // L
    case 79: return 0.0896870634282693  // O
    case 75: return 0.0  // K
    case 77: return 0.106715605641952  // M
    case 80: return 0.134451191031589  // P
    case 107: return 0.01  // k
    default: return 1
    }
case 111:  // o
    switch (codeB) {
    case 248: return 0.02  // ø
    case 111: return 0.0  // o
    case 246: return 0.02  // ö
    case 112: return 0.0817857095236348  // p
    default: return 1
    }
case 87:  // W
    switch (codeB) {
    case 87: return 0.0  // W
    case 119: return 0.01  // w
    default: return 1
    }
case 122:  // z
    switch (codeB) {
    case 122: return 0.0  // z
    default: return 1
    }
case 105:  // i
    switch (codeB) {
    case 111: return 0.0817857095236349  // o
    case 106: return 0.0918972441552164  // j
    case 105: return 0.0  // i
    case 107: return 0.106715605641952  // k
    case 117: return 0.0817857095236348  // u
    default: return 1
    }
case 84:  // T
    switch (codeB) {
    case 84: return 0.0  // T
    case 90: return 0.0817857095236348  // Z
    case 116: return 0.01  // t
    default: return 1
    }
case 108:  // l
    switch (codeB) {
    case 111: return 0.111617403896946  // o
    case 112: return 0.0881828399128482  // p
    case 108: return 0.0  // l
    default: return 1
    }
case 80:  // P
    switch (codeB) {
    case 80: return 0.0  // P
    case 112: return 0.01  // p
    default: return 1
    }
case 88:  // X
    switch (codeB) {
    case 88: return 0.0  // X
    case 120: return 0.01  // x
    case 89: return 0.0817857095236349  // Y
    default: return 1
    }
case 68:  // D
    switch (codeB) {
    case 88: return 0.0896870634282692  // X
    case 68: return 0.0  // D
    case 89: return 0.134451191031589  // Y
    case 82: return 0.106715605641952  // R
    case 87: return 0.134451191031589  // W
    case 70: return 0.0899642804759983  // F
    case 100: return 0.01  // d
    case 83: return 0.0899642804759983  // S
    case 69: return 0.0896870634282693  // E
    default: return 1
    }
case 110:  // n
    switch (codeB) {
    case 110: return 0.0  // n
    default: return 1
    }
case 74:  // J
    switch (codeB) {
    case 106: return 0.01  // j
    case 78: return 0.102233918872401  // N
    case 85: return 0.102233918872401  // U
    case 74: return 0.0  // J
    case 79: return 0.140770157928472  // O
    case 75: return 0.0899642804759983  // K
    case 77: return 0.0918972441552164  // M
    default: return 1
    }
case 117:  // u
    switch (codeB) {
    case 117: return 0.0  // u
    case 252: return 0.02  // ü
    case 122: return 0.0817857095236349  // z
    case 250: return 0.02  // ú
    default: return 1
    }
case 73:  // I
    switch (codeB) {
    case 74: return 0.0918972441552164  // J
    case 79: return 0.0817857095236349  // O
    case 73: return 0.0  // I
    case 75: return 0.106715605641952  // K
    case 105: return 0.01  // i
    case 85: return 0.0817857095236348  // U
    default: return 1
    }
case 77:  // M
    switch (codeB) {
    case 78: return 0.0817857095236348  // N
    case 109: return 0.01  // m
    case 77: return 0.0  // M
    default: return 1
    }
case 113:  // q
    switch (codeB) {
    case 113: return 0.0  // q
    case 115: return 0.12834245681794  // s
    case 119: return 0.0817857095236349  // w
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
    case 122: return 0.01  // z
    default: return 1
    }
case 98:  // b
    switch (codeB) {
    case 98: return 0.0  // b
    case 118: return 0.0817857095236348  // v
    case 103: return 0.0982298625374923  // g
    case 104: return 0.0982298625374923  // h
    case 110: return 0.0817857095236349  // n
    default: return 1
    }
case 78:  // N
    switch (codeB) {
    case 78: return 0.0  // N
    case 110: return 0.01  // n
    default: return 1
    }
case 89:  // Y
    switch (codeB) {
    case 121: return 0.01  // y
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
    case 106: return 0.0899642804759983  // j
    case 105: return 0.147272298828553  // i
    case 109: return 0.147272298828553  // m
    case 110: return 0.0947639998412172  // n
    case 117: return 0.0947639998412172  // u
    case 122: return 0.0982298625374924  // z
    case 104: return 0.0  // h
    default: return 1
    }
case 85:  // U
    switch (codeB) {
    case 218: return 0.02  // Ú
    case 117: return 0.01  // u
    case 220: return 0.02  // Ü
    case 85: return 0.0  // U
    case 90: return 0.0817857095236349  // Z
    default: return 1
    }
case 76:  // L
    switch (codeB) {
    case 76: return 0.0  // L
    case 79: return 0.111617403896946  // O
    case 108: return 0.01  // l
    case 80: return 0.0881828399128482  // P
    default: return 1
    }
case 102:  // f
    switch (codeB) {
    case 102: return 0.0  // f
    case 118: return 0.102233918872402  // v
    case 103: return 0.0899642804759983  // g
    case 114: return 0.0918972441552164  // r
    case 116: return 0.102233918872402  // t
    case 120: return 0.140770157928472  // x
    default: return 1
    }
case 79:  // O
    switch (codeB) {
    case 214: return 0.02  // Ö
    case 79: return 0.0  // O
    case 111: return 0.01  // o
    case 80: return 0.0817857095236348  // P
    case 216: return 0.02  // Ø
    default: return 1
    }
case 70:  // F
    switch (codeB) {
    case 88: return 0.140770157928472  // X
    case 86: return 0.102233918872402  // V
    case 84: return 0.102233918872402  // T
    case 82: return 0.0918972441552164  // R
    case 71: return 0.0899642804759983  // G
    case 102: return 0.01  // f
    case 70: return 0.0  // F
    default: return 1
    }
case 107:  // k
    switch (codeB) {
    case 111: return 0.0896870634282693  // o
    case 108: return 0.0899642804759983  // l
    case 107: return 0.0  // k
    case 109: return 0.106715605641952  // m
    case 112: return 0.134451191031589  // p
    default: return 1
    }
case 100:  // d
    switch (codeB) {
    case 119: return 0.134451191031589  // w
    case 114: return 0.106715605641952  // r
    case 101: return 0.0896870634282693  // e
    case 102: return 0.0899642804759983  // f
    case 115: return 0.0899642804759983  // s
    case 120: return 0.0896870634282692  // x
    case 100: return 0.0  // d
    case 121: return 0.134451191031589  // y
    default: return 1
    }
case 116:  // t
    switch (codeB) {
    case 116: return 0.0  // t
    case 122: return 0.0817857095236348  // z
    default: return 1
    }
case 97:  // a
    switch (codeB) {
    case 97: return 0.0  // a
    case 119: return 0.116886471687297  // w
    case 225: return 0.02  // á
    case 228: return 0.02  // ä
    case 226: return 0.02  // â
    case 224: return 0.02  // à
    case 115: return 0.0899642804759983  // s
    case 113: return 0.0874210226973429  // q
    case 121: return 0.116886471687297  // y
    default: return 1
    }
case 109:  // m
    switch (codeB) {
    case 109: return 0.0  // m
    case 110: return 0.0817857095236348  // n
    default: return 1
    }
case 115:  // s
    switch (codeB) {
    case 115: return 0.0  // s
    case 120: return 0.111617403896946  // x
    case 119: return 0.0881828399128482  // w
    case 121: return 0.0881828399128482  // y
    case 223: return 0.02  // ß
    default: return 1
    }
case 103:  // g
    switch (codeB) {
    case 118: return 0.0947639998412171  // v
    case 103: return 0.0  // g
    case 114: return 0.147272298828553  // r
    case 116: return 0.0947639998412172  // t
    case 104: return 0.0899642804759983  // h
    case 122: return 0.0982298625374924  // z
    default: return 1
    }
case 81:  // Q
    switch (codeB) {
    case 87: return 0.0817857095236349  // W
    case 113: return 0.01  // q
    case 83: return 0.12834245681794  // S
    case 81: return 0.0  // Q
    default: return 1
    }
default: return 1
}
}
