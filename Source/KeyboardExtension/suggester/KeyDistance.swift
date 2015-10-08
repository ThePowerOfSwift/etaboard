// generated
import Foundation
func distanceBetweenUInt16Chars(keyA: UInt16, and keyB: UInt16) -> Double {
if keyA == keyB { return 0 }
switch (keyA) {
case 97,65,228,196,225,193,224,192,226,194:  // a
    switch (keyB) {
    case 97,65,228,196,225,193,224,192,226,194: return 0.0  // a
    case 113,81: return 0.0874210226973429  // q
    case 115,83,223,83: return 0.0899642804759983  // s
    case 119,87: return 0.116886471687297  // w
    case 121,89: return 0.116886471687297  // y
    default: return 1
    }
case 98,66:  // b
    switch (keyB) {
    case 98,66: return 0.0  // b
    case 103,71: return 0.0982298625374923  // g
    case 104,72: return 0.0982298625374923  // h
    case 110,78: return 0.0817857095236349  // n
    case 118,86: return 0.0817857095236348  // v
    default: return 1
    }
case 99,67:  // c
    switch (keyB) {
    case 99,67: return 0.0  // c
    case 100,68: return 0.106715605641952  // d
    case 102,70: return 0.0918972441552164  // f
    case 103,71: return 0.147272298828553  // g
    case 118,86: return 0.0817857095236349  // v
    case 120,88: return 0.0817857095236349  // x
    default: return 1
    }
case 100,68:  // d
    switch (keyB) {
    case 99,67: return 0.106715605641952  // c
    case 100,68: return 0.0  // d
    case 101,69: return 0.0896870634282693  // e
    case 102,70: return 0.0899642804759983  // f
    case 114,82: return 0.106715605641952  // r
    case 115,83,223,83: return 0.0899642804759983  // s
    case 119,87: return 0.134451191031589  // w
    case 120,88: return 0.0896870634282692  // x
    case 121,89: return 0.134451191031589  // y
    default: return 1
    }
case 101,69:  // e
    switch (keyB) {
    case 100,68: return 0.0896870634282693  // d
    case 101,69: return 0.0  // e
    case 102,70: return 0.140770157928472  // f
    case 114,82: return 0.0817857095236349  // r
    case 115,83,223,83: return 0.111617403896947  // s
    case 119,87: return 0.0817857095236349  // w
    default: return 1
    }
case 102,70:  // f
    switch (keyB) {
    case 99,67: return 0.0918972441552164  // c
    case 100,68: return 0.0899642804759983  // d
    case 101,69: return 0.140770157928472  // e
    case 102,70: return 0.0  // f
    case 103,71: return 0.0899642804759983  // g
    case 114,82: return 0.0918972441552164  // r
    case 116,84: return 0.102233918872402  // t
    case 118,86: return 0.102233918872402  // v
    case 120,88: return 0.140770157928472  // x
    default: return 1
    }
case 103,71:  // g
    switch (keyB) {
    case 98,66: return 0.0982298625374923  // b
    case 99,67: return 0.147272298828553  // c
    case 102,70: return 0.0899642804759983  // f
    case 103,71: return 0.0  // g
    case 104,72: return 0.0899642804759983  // h
    case 114,82: return 0.147272298828553  // r
    case 116,84: return 0.0947639998412172  // t
    case 118,86: return 0.0947639998412171  // v
    case 122,90: return 0.0982298625374924  // z
    default: return 1
    }
case 104,72:  // h
    switch (keyB) {
    case 98,66: return 0.0982298625374923  // b
    case 103,71: return 0.0899642804759983  // g
    case 104,72: return 0.0  // h
    case 105,73: return 0.147272298828553  // i
    case 106,74: return 0.0899642804759983  // j
    case 109,77: return 0.147272298828553  // m
    case 110,78: return 0.0947639998412172  // n
    case 117,85,252,220,250,218: return 0.0947639998412172  // u
    case 122,90: return 0.0982298625374924  // z
    default: return 1
    }
case 105,73:  // i
    switch (keyB) {
    case 104,72: return 0.147272298828553  // h
    case 105,73: return 0.0  // i
    case 106,74: return 0.0918972441552164  // j
    case 107,75: return 0.106715605641952  // k
    case 111,79,246,214,248,216: return 0.0817857095236349  // o
    case 117,85,252,220,250,218: return 0.0817857095236348  // u
    default: return 1
    }
case 106,74:  // j
    switch (keyB) {
    case 104,72: return 0.0899642804759983  // h
    case 105,73: return 0.0918972441552164  // i
    case 106,74: return 0.0  // j
    case 107,75: return 0.0899642804759983  // k
    case 109,77: return 0.0918972441552164  // m
    case 110,78: return 0.102233918872401  // n
    case 111,79,246,214,248,216: return 0.140770157928472  // o
    case 117,85,252,220,250,218: return 0.102233918872401  // u
    default: return 1
    }
case 107,75:  // k
    switch (keyB) {
    case 105,73: return 0.106715605641952  // i
    case 106,74: return 0.0899642804759983  // j
    case 107,75: return 0.0  // k
    case 108,76: return 0.0899642804759983  // l
    case 109,77: return 0.106715605641952  // m
    case 111,79,246,214,248,216: return 0.0896870634282693  // o
    case 112,80: return 0.134451191031589  // p
    default: return 1
    }
case 108,76:  // l
    switch (keyB) {
    case 107,75: return 0.0899642804759983  // k
    case 108,76: return 0.0  // l
    case 111,79,246,214,248,216: return 0.111617403896946  // o
    case 112,80: return 0.0881828399128482  // p
    default: return 1
    }
case 109,77:  // m
    switch (keyB) {
    case 104,72: return 0.147272298828553  // h
    case 106,74: return 0.0918972441552164  // j
    case 107,75: return 0.106715605641952  // k
    case 109,77: return 0.0  // m
    case 110,78: return 0.0817857095236348  // n
    default: return 1
    }
case 110,78:  // n
    switch (keyB) {
    case 98,66: return 0.0817857095236349  // b
    case 104,72: return 0.0947639998412172  // h
    case 106,74: return 0.102233918872401  // j
    case 109,77: return 0.0817857095236348  // m
    case 110,78: return 0.0  // n
    default: return 1
    }
case 111,79,246,214,248,216:  // o
    switch (keyB) {
    case 105,73: return 0.0817857095236349  // i
    case 106,74: return 0.140770157928472  // j
    case 107,75: return 0.0896870634282693  // k
    case 108,76: return 0.111617403896946  // l
    case 111,79,246,214,248,216: return 0.0  // o
    case 112,80: return 0.0817857095236348  // p
    default: return 1
    }
case 112,80:  // p
    switch (keyB) {
    case 107,75: return 0.134451191031589  // k
    case 108,76: return 0.0881828399128482  // l
    case 111,79,246,214,248,216: return 0.0817857095236348  // o
    case 112,80: return 0.0  // p
    default: return 1
    }
case 113,81:  // q
    switch (keyB) {
    case 97,65,228,196,225,193,224,192,226,194: return 0.0874210226973429  // a
    case 113,81: return 0.0  // q
    case 115,83,223,83: return 0.12834245681794  // s
    case 119,87: return 0.0817857095236349  // w
    default: return 1
    }
case 114,82:  // r
    switch (keyB) {
    case 100,68: return 0.106715605641952  // d
    case 101,69: return 0.0817857095236349  // e
    case 102,70: return 0.0918972441552164  // f
    case 103,71: return 0.147272298828553  // g
    case 114,82: return 0.0  // r
    case 116,84: return 0.0817857095236349  // t
    default: return 1
    }
case 115,83,223,83:  // s
    switch (keyB) {
    case 97,65,228,196,225,193,224,192,226,194: return 0.0899642804759983  // a
    case 100,68: return 0.0899642804759983  // d
    case 101,69: return 0.111617403896947  // e
    case 113,81: return 0.12834245681794  // q
    case 115,83,223,83: return 0.0  // s
    case 119,87: return 0.0881828399128482  // w
    case 120,88: return 0.111617403896946  // x
    case 121,89: return 0.0881828399128482  // y
    default: return 1
    }
case 116,84:  // t
    switch (keyB) {
    case 102,70: return 0.102233918872402  // f
    case 103,71: return 0.0947639998412172  // g
    case 114,82: return 0.0817857095236349  // r
    case 116,84: return 0.0  // t
    case 122,90: return 0.0817857095236348  // z
    default: return 1
    }
case 117,85,252,220,250,218:  // u
    switch (keyB) {
    case 104,72: return 0.0947639998412172  // h
    case 105,73: return 0.0817857095236348  // i
    case 106,74: return 0.102233918872401  // j
    case 117,85,252,220,250,218: return 0.0  // u
    case 122,90: return 0.0817857095236349  // z
    default: return 1
    }
case 118,86:  // v
    switch (keyB) {
    case 98,66: return 0.0817857095236348  // b
    case 99,67: return 0.0817857095236349  // c
    case 102,70: return 0.102233918872402  // f
    case 103,71: return 0.0947639998412171  // g
    case 118,86: return 0.0  // v
    default: return 1
    }
case 119,87:  // w
    switch (keyB) {
    case 97,65,228,196,225,193,224,192,226,194: return 0.116886471687297  // a
    case 100,68: return 0.134451191031589  // d
    case 101,69: return 0.0817857095236349  // e
    case 113,81: return 0.0817857095236349  // q
    case 115,83,223,83: return 0.0881828399128482  // s
    case 119,87: return 0.0  // w
    default: return 1
    }
case 120,88:  // x
    switch (keyB) {
    case 99,67: return 0.0817857095236349  // c
    case 100,68: return 0.0896870634282692  // d
    case 102,70: return 0.140770157928472  // f
    case 115,83,223,83: return 0.111617403896946  // s
    case 120,88: return 0.0  // x
    case 121,89: return 0.0817857095236349  // y
    default: return 1
    }
case 121,89:  // y
    switch (keyB) {
    case 97,65,228,196,225,193,224,192,226,194: return 0.116886471687297  // a
    case 100,68: return 0.134451191031589  // d
    case 115,83,223,83: return 0.0881828399128482  // s
    case 120,88: return 0.0817857095236349  // x
    case 121,89: return 0.0  // y
    default: return 1
    }
case 122,90:  // z
    switch (keyB) {
    case 103,71: return 0.0982298625374924  // g
    case 104,72: return 0.0982298625374924  // h
    case 116,84: return 0.0817857095236348  // t
    case 117,85,252,220,250,218: return 0.0817857095236349  // u
    case 122,90: return 0.0  // z
    default: return 1
    }
default: return 1
}
}
