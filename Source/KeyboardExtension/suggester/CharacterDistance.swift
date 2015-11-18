// generated
import Foundation
func distanceBetweenUInt16Chars(codeA: UInt16, and codeB: UInt16) -> Distance {
if codeA == codeB { return 0 }
switch (codeA) {
case 97:  // a
    switch (codeB) {
    case 97: return 0.0  // a
    case 113: return 0.0874210226973429  // q
    case 115: return 0.0899642804759983  // s
    case 119: return 0.116886471687297  // w
    case 121: return 0.116886471687297  // y
    case 65: return 0.01  // A)
    case 228,225,224,226: return 0.02  // ["ä", "á", "à", "â"]
    default: return 1
    }
case 65:  // A
    switch (codeB) {
    case 97: return 0.01  // a
    default: return 1
    }
case 228,225,224,226:  // ["ä", "á", "à", "â"]
    switch (codeB) {
    case 97: return 0.02  // a
    default: return 1
    }
case 98:  // b
    switch (codeB) {
    case 98: return 0.0  // b
    case 103: return 0.0982298625374923  // g
    case 104: return 0.0982298625374923  // h
    case 110: return 0.0817857095236349  // n
    case 118: return 0.0817857095236348  // v
    case 66: return 0.01  // B)
    default: return 1
    }
case 66:  // B
    switch (codeB) {
    case 98: return 0.01  // b
    default: return 1
    }
case 99:  // c
    switch (codeB) {
    case 99: return 0.0  // c
    case 100: return 0.106715605641952  // d
    case 102: return 0.0918972441552164  // f
    case 103: return 0.147272298828553  // g
    case 118: return 0.0817857095236349  // v
    case 120: return 0.0817857095236349  // x
    case 67: return 0.01  // C)
    default: return 1
    }
case 67:  // C
    switch (codeB) {
    case 99: return 0.01  // c
    default: return 1
    }
case 100:  // d
    switch (codeB) {
    case 99: return 0.106715605641952  // c
    case 100: return 0.0  // d
    case 101: return 0.0896870634282693  // e
    case 102: return 0.0899642804759983  // f
    case 114: return 0.106715605641952  // r
    case 115: return 0.0899642804759983  // s
    case 119: return 0.134451191031589  // w
    case 120: return 0.0896870634282692  // x
    case 121: return 0.134451191031589  // y
    case 68: return 0.01  // D)
    default: return 1
    }
case 68:  // D
    switch (codeB) {
    case 100: return 0.01  // d
    default: return 1
    }
case 101:  // e
    switch (codeB) {
    case 100: return 0.0896870634282693  // d
    case 101: return 0.0  // e
    case 102: return 0.140770157928472  // f
    case 114: return 0.0817857095236349  // r
    case 115: return 0.111617403896947  // s
    case 119: return 0.0817857095236349  // w
    case 69: return 0.01  // E)
    default: return 1
    }
case 69:  // E
    switch (codeB) {
    case 101: return 0.01  // e
    default: return 1
    }
case 102:  // f
    switch (codeB) {
    case 99: return 0.0918972441552164  // c
    case 100: return 0.0899642804759983  // d
    case 101: return 0.140770157928472  // e
    case 102: return 0.0  // f
    case 103: return 0.0899642804759983  // g
    case 114: return 0.0918972441552164  // r
    case 116: return 0.102233918872402  // t
    case 118: return 0.102233918872402  // v
    case 120: return 0.140770157928472  // x
    case 70: return 0.01  // F)
    default: return 1
    }
case 70:  // F
    switch (codeB) {
    case 102: return 0.01  // f
    default: return 1
    }
case 103:  // g
    switch (codeB) {
    case 98: return 0.0982298625374923  // b
    case 99: return 0.147272298828553  // c
    case 102: return 0.0899642804759983  // f
    case 103: return 0.0  // g
    case 104: return 0.0899642804759983  // h
    case 114: return 0.147272298828553  // r
    case 116: return 0.0947639998412172  // t
    case 118: return 0.0947639998412171  // v
    case 122: return 0.0982298625374924  // z
    case 71: return 0.01  // G)
    default: return 1
    }
case 71:  // G
    switch (codeB) {
    case 103: return 0.01  // g
    default: return 1
    }
case 104:  // h
    switch (codeB) {
    case 98: return 0.0982298625374923  // b
    case 103: return 0.0899642804759983  // g
    case 104: return 0.0  // h
    case 105: return 0.147272298828553  // i
    case 106: return 0.0899642804759983  // j
    case 109: return 0.147272298828553  // m
    case 110: return 0.0947639998412172  // n
    case 117: return 0.0947639998412172  // u
    case 122: return 0.0982298625374924  // z
    case 72: return 0.01  // H)
    default: return 1
    }
case 72:  // H
    switch (codeB) {
    case 104: return 0.01  // h
    default: return 1
    }
case 105:  // i
    switch (codeB) {
    case 104: return 0.147272298828553  // h
    case 105: return 0.0  // i
    case 106: return 0.0918972441552164  // j
    case 107: return 0.106715605641952  // k
    case 111: return 0.0817857095236349  // o
    case 117: return 0.0817857095236348  // u
    case 73: return 0.01  // I)
    default: return 1
    }
case 73:  // I
    switch (codeB) {
    case 105: return 0.01  // i
    default: return 1
    }
case 106:  // j
    switch (codeB) {
    case 104: return 0.0899642804759983  // h
    case 105: return 0.0918972441552164  // i
    case 106: return 0.0  // j
    case 107: return 0.0899642804759983  // k
    case 109: return 0.0918972441552164  // m
    case 110: return 0.102233918872401  // n
    case 111: return 0.140770157928472  // o
    case 117: return 0.102233918872401  // u
    case 74: return 0.01  // J)
    default: return 1
    }
case 74:  // J
    switch (codeB) {
    case 106: return 0.01  // j
    default: return 1
    }
case 107:  // k
    switch (codeB) {
    case 105: return 0.106715605641952  // i
    case 106: return 0.0899642804759983  // j
    case 107: return 0.0  // k
    case 108: return 0.0899642804759983  // l
    case 109: return 0.106715605641952  // m
    case 111: return 0.0896870634282693  // o
    case 112: return 0.134451191031589  // p
    case 75: return 0.01  // K)
    default: return 1
    }
case 75:  // K
    switch (codeB) {
    case 107: return 0.01  // k
    default: return 1
    }
case 108:  // l
    switch (codeB) {
    case 107: return 0.0899642804759983  // k
    case 108: return 0.0  // l
    case 111: return 0.111617403896946  // o
    case 112: return 0.0881828399128482  // p
    case 76: return 0.01  // L)
    default: return 1
    }
case 76:  // L
    switch (codeB) {
    case 108: return 0.01  // l
    default: return 1
    }
case 109:  // m
    switch (codeB) {
    case 104: return 0.147272298828553  // h
    case 106: return 0.0918972441552164  // j
    case 107: return 0.106715605641952  // k
    case 109: return 0.0  // m
    case 110: return 0.0817857095236348  // n
    case 77: return 0.01  // M)
    default: return 1
    }
case 77:  // M
    switch (codeB) {
    case 109: return 0.01  // m
    default: return 1
    }
case 110:  // n
    switch (codeB) {
    case 98: return 0.0817857095236349  // b
    case 104: return 0.0947639998412172  // h
    case 106: return 0.102233918872401  // j
    case 109: return 0.0817857095236348  // m
    case 110: return 0.0  // n
    case 78: return 0.01  // N)
    default: return 1
    }
case 78:  // N
    switch (codeB) {
    case 110: return 0.01  // n
    default: return 1
    }
case 111:  // o
    switch (codeB) {
    case 105: return 0.0817857095236349  // i
    case 106: return 0.140770157928472  // j
    case 107: return 0.0896870634282693  // k
    case 108: return 0.111617403896946  // l
    case 111: return 0.0  // o
    case 112: return 0.0817857095236348  // p
    case 79: return 0.01  // O)
    case 246,248: return 0.02  // ["ö", "ø"]
    default: return 1
    }
case 79:  // O
    switch (codeB) {
    case 111: return 0.01  // o
    default: return 1
    }
case 246,248:  // ["ö", "ø"]
    switch (codeB) {
    case 111: return 0.02  // o
    default: return 1
    }
case 112:  // p
    switch (codeB) {
    case 107: return 0.134451191031589  // k
    case 108: return 0.0881828399128482  // l
    case 111: return 0.0817857095236348  // o
    case 112: return 0.0  // p
    case 80: return 0.01  // P)
    default: return 1
    }
case 80:  // P
    switch (codeB) {
    case 112: return 0.01  // p
    default: return 1
    }
case 113:  // q
    switch (codeB) {
    case 97: return 0.0874210226973429  // a
    case 113: return 0.0  // q
    case 115: return 0.12834245681794  // s
    case 119: return 0.0817857095236349  // w
    case 81: return 0.01  // Q)
    default: return 1
    }
case 81:  // Q
    switch (codeB) {
    case 113: return 0.01  // q
    default: return 1
    }
case 114:  // r
    switch (codeB) {
    case 100: return 0.106715605641952  // d
    case 101: return 0.0817857095236349  // e
    case 102: return 0.0918972441552164  // f
    case 103: return 0.147272298828553  // g
    case 114: return 0.0  // r
    case 116: return 0.0817857095236349  // t
    case 82: return 0.01  // R)
    default: return 1
    }
case 82:  // R
    switch (codeB) {
    case 114: return 0.01  // r
    default: return 1
    }
case 115:  // s
    switch (codeB) {
    case 97: return 0.0899642804759983  // a
    case 100: return 0.0899642804759983  // d
    case 101: return 0.111617403896947  // e
    case 113: return 0.12834245681794  // q
    case 115: return 0.0  // s
    case 119: return 0.0881828399128482  // w
    case 120: return 0.111617403896946  // x
    case 121: return 0.0881828399128482  // y
    case 83: return 0.01  // S)
    case 223: return 0.02  // ["ß"]
    default: return 1
    }
case 83:  // S
    switch (codeB) {
    case 115: return 0.01  // s
    default: return 1
    }
case 223:  // ["ß"]
    switch (codeB) {
    case 115: return 0.02  // s
    default: return 1
    }
case 116:  // t
    switch (codeB) {
    case 102: return 0.102233918872402  // f
    case 103: return 0.0947639998412172  // g
    case 114: return 0.0817857095236349  // r
    case 116: return 0.0  // t
    case 122: return 0.0817857095236348  // z
    case 84: return 0.01  // T)
    default: return 1
    }
case 84:  // T
    switch (codeB) {
    case 116: return 0.01  // t
    default: return 1
    }
case 117:  // u
    switch (codeB) {
    case 104: return 0.0947639998412172  // h
    case 105: return 0.0817857095236348  // i
    case 106: return 0.102233918872401  // j
    case 117: return 0.0  // u
    case 122: return 0.0817857095236349  // z
    case 85: return 0.01  // U)
    case 252,250: return 0.02  // ["ü", "ú"]
    default: return 1
    }
case 85:  // U
    switch (codeB) {
    case 117: return 0.01  // u
    default: return 1
    }
case 252,250:  // ["ü", "ú"]
    switch (codeB) {
    case 117: return 0.02  // u
    default: return 1
    }
case 118:  // v
    switch (codeB) {
    case 98: return 0.0817857095236348  // b
    case 99: return 0.0817857095236349  // c
    case 102: return 0.102233918872402  // f
    case 103: return 0.0947639998412171  // g
    case 118: return 0.0  // v
    case 86: return 0.01  // V)
    default: return 1
    }
case 86:  // V
    switch (codeB) {
    case 118: return 0.01  // v
    default: return 1
    }
case 119:  // w
    switch (codeB) {
    case 97: return 0.116886471687297  // a
    case 100: return 0.134451191031589  // d
    case 101: return 0.0817857095236349  // e
    case 113: return 0.0817857095236349  // q
    case 115: return 0.0881828399128482  // s
    case 119: return 0.0  // w
    case 87: return 0.01  // W)
    default: return 1
    }
case 87:  // W
    switch (codeB) {
    case 119: return 0.01  // w
    default: return 1
    }
case 120:  // x
    switch (codeB) {
    case 99: return 0.0817857095236349  // c
    case 100: return 0.0896870634282692  // d
    case 102: return 0.140770157928472  // f
    case 115: return 0.111617403896946  // s
    case 120: return 0.0  // x
    case 121: return 0.0817857095236349  // y
    case 88: return 0.01  // X)
    default: return 1
    }
case 88:  // X
    switch (codeB) {
    case 120: return 0.01  // x
    default: return 1
    }
case 121:  // y
    switch (codeB) {
    case 97: return 0.116886471687297  // a
    case 100: return 0.134451191031589  // d
    case 115: return 0.0881828399128482  // s
    case 120: return 0.0817857095236349  // x
    case 121: return 0.0  // y
    case 89: return 0.01  // Y)
    default: return 1
    }
case 89:  // Y
    switch (codeB) {
    case 121: return 0.01  // y
    default: return 1
    }
case 122:  // z
    switch (codeB) {
    case 103: return 0.0982298625374924  // g
    case 104: return 0.0982298625374924  // h
    case 116: return 0.0817857095236348  // t
    case 117: return 0.0817857095236349  // u
    case 122: return 0.0  // z
    case 90: return 0.01  // Z)
    default: return 1
    }
case 90:  // Z
    switch (codeB) {
    case 122: return 0.01  // z
    default: return 1
    }
default: return 1
}
}
