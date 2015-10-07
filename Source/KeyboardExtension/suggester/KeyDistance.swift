// generated
import Foundation
func distanceBetweenUInt16Chars(keyA: UInt16, and keyB: UInt16) -> Double {
if keyA == keyB { return 0 }
switch (keyA) {
case 97:  // a
    switch (keyB) {
    case 97: return 0.0  // a
    case 100: return 0.149940467459997  // d
    case 113: return 0.0873253282487024  // q
    case 115: return 0.0749702337299986  // s
    case 119: return 0.115092349438502  // w
    case 121: return 0.115092349438502  // y
    default: return 1
    }
case 98:  // b
    switch (keyB) {
    case 98: return 0.0  // b
    case 99: return 0.149940467459997  // c
    case 103: return 0.115092349438502  // g
    case 104: return 0.0873253282487024  // h
    case 106: return 0.115092349438502  // j
    case 109: return 0.149940467459997  // m
    case 110: return 0.0749702337299986  // n
    case 118: return 0.0749702337299986  // v
    default: return 1
    }
case 99:  // c
    switch (keyB) {
    case 98: return 0.149940467459997  // b
    case 99: return 0.0  // c
    case 100: return 0.115092349438502  // d
    case 102: return 0.0873253282487024  // f
    case 103: return 0.115092349438502  // g
    case 118: return 0.0749702337299986  // v
    case 120: return 0.0749702337299986  // x
    case 121: return 0.149940467459997  // y
    default: return 1
    }
case 100:  // d
    switch (keyB) {
    case 97: return 0.149940467459997  // a
    case 99: return 0.115092349438502  // c
    case 100: return 0.0  // d
    case 101: return 0.0873253282487024  // e
    case 102: return 0.0749702337299986  // f
    case 103: return 0.149940467459997  // g
    case 114: return 0.115092349438502  // r
    case 115: return 0.0749702337299986  // s
    case 119: return 0.115092349438502  // w
    case 120: return 0.0873253282487024  // x
    case 121: return 0.115092349438502  // y
    default: return 1
    }
case 101:  // e
    switch (keyB) {
    case 100: return 0.0873253282487024  // d
    case 101: return 0.0  // e
    case 102: return 0.115092349438502  // f
    case 113: return 0.149940467459997  // q
    case 114: return 0.0749702337299986  // r
    case 115: return 0.115092349438502  // s
    case 116: return 0.149940467459997  // t
    case 119: return 0.0749702337299986  // w
    default: return 1
    }
case 102:  // f
    switch (keyB) {
    case 99: return 0.0873253282487024  // c
    case 100: return 0.0749702337299986  // d
    case 101: return 0.115092349438502  // e
    case 102: return 0.0  // f
    case 103: return 0.0749702337299986  // g
    case 104: return 0.149940467459997  // h
    case 114: return 0.0873253282487024  // r
    case 115: return 0.149940467459997  // s
    case 116: return 0.115092349438502  // t
    case 118: return 0.115092349438502  // v
    case 120: return 0.115092349438502  // x
    default: return 1
    }
case 103:  // g
    switch (keyB) {
    case 98: return 0.115092349438502  // b
    case 99: return 0.115092349438502  // c
    case 100: return 0.149940467459997  // d
    case 102: return 0.0749702337299986  // f
    case 103: return 0.0  // g
    case 104: return 0.0749702337299986  // h
    case 106: return 0.149940467459997  // j
    case 114: return 0.115092349438502  // r
    case 116: return 0.0873253282487024  // t
    case 118: return 0.0873253282487024  // v
    case 122: return 0.115092349438502  // z
    default: return 1
    }
case 104:  // h
    switch (keyB) {
    case 98: return 0.0873253282487024  // b
    case 102: return 0.149940467459997  // f
    case 103: return 0.0749702337299986  // g
    case 104: return 0.0  // h
    case 106: return 0.0749702337299986  // j
    case 107: return 0.149940467459997  // k
    case 110: return 0.115092349438502  // n
    case 116: return 0.115092349438502  // t
    case 117: return 0.115092349438502  // u
    case 118: return 0.115092349438502  // v
    case 122: return 0.0873253282487024  // z
    default: return 1
    }
case 105:  // i
    switch (keyB) {
    case 105: return 0.0  // i
    case 106: return 0.115092349438502  // j
    case 107: return 0.0873253282487024  // k
    case 108: return 0.115092349438502  // l
    case 111: return 0.0749702337299986  // o
    case 112: return 0.149940467459997  // p
    case 117: return 0.0749702337299986  // u
    case 122: return 0.149940467459997  // z
    default: return 1
    }
case 106:  // j
    switch (keyB) {
    case 98: return 0.115092349438502  // b
    case 103: return 0.149940467459997  // g
    case 104: return 0.0749702337299986  // h
    case 105: return 0.115092349438502  // i
    case 106: return 0.0  // j
    case 107: return 0.0749702337299986  // k
    case 108: return 0.149940467459997  // l
    case 109: return 0.115092349438502  // m
    case 110: return 0.0873253282487024  // n
    case 117: return 0.0873253282487024  // u
    case 122: return 0.115092349438502  // z
    default: return 1
    }
case 107:  // k
    switch (keyB) {
    case 104: return 0.149940467459997  // h
    case 105: return 0.0873253282487024  // i
    case 106: return 0.0749702337299986  // j
    case 107: return 0.0  // k
    case 108: return 0.0749702337299986  // l
    case 109: return 0.0873253282487024  // m
    case 110: return 0.115092349438502  // n
    case 111: return 0.115092349438502  // o
    case 117: return 0.115092349438502  // u
    default: return 1
    }
case 108:  // l
    switch (keyB) {
    case 105: return 0.115092349438502  // i
    case 106: return 0.149940467459997  // j
    case 107: return 0.0749702337299986  // k
    case 108: return 0.0  // l
    case 109: return 0.115092349438502  // m
    case 111: return 0.0873253282487024  // o
    case 112: return 0.115092349438502  // p
    default: return 1
    }
case 109:  // m
    switch (keyB) {
    case 98: return 0.149940467459997  // b
    case 106: return 0.115092349438502  // j
    case 107: return 0.0873253282487024  // k
    case 108: return 0.115092349438502  // l
    case 109: return 0.0  // m
    case 110: return 0.0749702337299986  // n
    default: return 1
    }
case 110:  // n
    switch (keyB) {
    case 98: return 0.0749702337299986  // b
    case 104: return 0.115092349438502  // h
    case 106: return 0.0873253282487024  // j
    case 107: return 0.115092349438502  // k
    case 109: return 0.0749702337299986  // m
    case 110: return 0.0  // n
    case 118: return 0.149940467459997  // v
    default: return 1
    }
case 111:  // o
    switch (keyB) {
    case 105: return 0.0749702337299986  // i
    case 107: return 0.115092349438502  // k
    case 108: return 0.0873253282487024  // l
    case 111: return 0.0  // o
    case 112: return 0.0749702337299986  // p
    case 117: return 0.149940467459997  // u
    default: return 1
    }
case 112:  // p
    switch (keyB) {
    case 105: return 0.149940467459997  // i
    case 108: return 0.115092349438502  // l
    case 111: return 0.0749702337299986  // o
    case 112: return 0.0  // p
    default: return 1
    }
case 113:  // q
    switch (keyB) {
    case 97: return 0.0873253282487024  // a
    case 101: return 0.149940467459997  // e
    case 113: return 0.0  // q
    case 115: return 0.115092349438502  // s
    case 119: return 0.0749702337299986  // w
    default: return 1
    }
case 114:  // r
    switch (keyB) {
    case 100: return 0.115092349438502  // d
    case 101: return 0.0749702337299986  // e
    case 102: return 0.0873253282487024  // f
    case 103: return 0.115092349438502  // g
    case 114: return 0.0  // r
    case 116: return 0.0749702337299986  // t
    case 119: return 0.149940467459997  // w
    case 122: return 0.149940467459997  // z
    default: return 1
    }
case 115:  // s
    switch (keyB) {
    case 97: return 0.0749702337299986  // a
    case 100: return 0.0749702337299986  // d
    case 101: return 0.115092349438502  // e
    case 102: return 0.149940467459997  // f
    case 113: return 0.115092349438502  // q
    case 115: return 0.0  // s
    case 119: return 0.0873253282487024  // w
    case 120: return 0.115092349438502  // x
    case 121: return 0.0873253282487024  // y
    default: return 1
    }
case 116:  // t
    switch (keyB) {
    case 101: return 0.149940467459997  // e
    case 102: return 0.115092349438502  // f
    case 103: return 0.0873253282487024  // g
    case 104: return 0.115092349438502  // h
    case 114: return 0.0749702337299986  // r
    case 116: return 0.0  // t
    case 117: return 0.149940467459997  // u
    case 122: return 0.0749702337299986  // z
    default: return 1
    }
case 117:  // u
    switch (keyB) {
    case 104: return 0.115092349438502  // h
    case 105: return 0.0749702337299986  // i
    case 106: return 0.0873253282487024  // j
    case 107: return 0.115092349438502  // k
    case 111: return 0.149940467459997  // o
    case 116: return 0.149940467459997  // t
    case 117: return 0.0  // u
    case 122: return 0.0749702337299986  // z
    default: return 1
    }
case 118:  // v
    switch (keyB) {
    case 98: return 0.0749702337299986  // b
    case 99: return 0.0749702337299986  // c
    case 102: return 0.115092349438502  // f
    case 103: return 0.0873253282487024  // g
    case 104: return 0.115092349438502  // h
    case 110: return 0.149940467459997  // n
    case 118: return 0.0  // v
    case 120: return 0.149940467459997  // x
    default: return 1
    }
case 119:  // w
    switch (keyB) {
    case 97: return 0.115092349438502  // a
    case 100: return 0.115092349438502  // d
    case 101: return 0.0749702337299986  // e
    case 113: return 0.0749702337299986  // q
    case 114: return 0.149940467459997  // r
    case 115: return 0.0873253282487024  // s
    case 119: return 0.0  // w
    default: return 1
    }
case 120:  // x
    switch (keyB) {
    case 99: return 0.0749702337299986  // c
    case 100: return 0.0873253282487024  // d
    case 102: return 0.115092349438502  // f
    case 115: return 0.115092349438502  // s
    case 118: return 0.149940467459997  // v
    case 120: return 0.0  // x
    case 121: return 0.0749702337299986  // y
    default: return 1
    }
case 121:  // y
    switch (keyB) {
    case 97: return 0.115092349438502  // a
    case 99: return 0.149940467459997  // c
    case 100: return 0.115092349438502  // d
    case 115: return 0.0873253282487024  // s
    case 120: return 0.0749702337299986  // x
    case 121: return 0.0  // y
    default: return 1
    }
case 122:  // z
    switch (keyB) {
    case 103: return 0.115092349438502  // g
    case 104: return 0.0873253282487024  // h
    case 105: return 0.149940467459997  // i
    case 106: return 0.115092349438502  // j
    case 114: return 0.149940467459997  // r
    case 116: return 0.0749702337299986  // t
    case 117: return 0.0749702337299986  // u
    case 122: return 0.0  // z
    default: return 1
    }
default: return 1
}
}
