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
    case 106: return 0.117565232996638  // j
    case 85: return 0.0899664937848628  // U
    case 110: return 0.119966493784863  // n
    case 74: return 0.0875652329966384  // J
    case 117: return 0.119966493784863  // u
    case 73: return 0.141894725151684  // I
    case 77: return 0.141894725151684  // M
    case 118: return 0.17844254188022  // v
    case 90: return 0.0934219553527868  // Z
    case 116: return 0.17844254188022  // t
    case 122: return 0.123421955352787  // z
    case 98: return 0.123421955352787  // b
    case 105: return 0.171894725151684  // i
    case 78: return 0.0899664937848628  // N
    case 84: return 0.14844254188022  // T
    case 109: return 0.171894725151684  // m
    case 103: return 0.117565232996638  // g
    case 104: return 0.03  // h
    default: return 1
    }
case 218:  // Ú
    switch (codeB) {
    case 250: return 0.03  // ú
    default: return 1
    }
case 119:  // w
    switch (codeB) {
    case 119: return 0.0  // w
    case 225: return 0.151936643553021  // á
    case 228: return 0.151936643553021  // ä
    case 233: return 0.119604757269671  // é
    case 226: return 0.151936643553021  // â
    case 224: return 0.151936643553021  // à
    case 223: return 0.123386598896635  // ß
    case 229: return 0.151936643553021  // å
    case 232: return 0.119604757269671  // è
    case 234: return 0.119604757269671  // ê
    default: return 1
    }
case 193:  // Á
    switch (codeB) {
    case 225: return 0.03  // á
    default: return 1
    }
case 120:  // x
    switch (codeB) {
    case 223: return 0.146720040486886  // ß
    case 120: return 0.0  // x
    case 121: return 0.0796047572696713  // y
    default: return 1
    }
case 83:  // S
    switch (codeB) {
    case 88: return 0.106720040486886  // X
    case 119: return 0.113386598896635  // w
    case 223: return 0.07  // ß
    case 87: return 0.0833865988966355  // W
    case 120: return 0.136720040486886  // x
    case 113: return 0.153253062718541  // q
    case 100: return 0.117565232996638  // d
    case 83: return 0.0  // S
    case 97: return 0.117565232996638  // a
    case 89: return 0.0833865988966354  // Y
    case 101: return 0.136720040486886  // e
    case 115: return 0.03  // s
    case 121: return 0.113386598896635  // y
    default: return 1
    }
case 65:  // A
    switch (codeB) {
    case 196: return 0.04  // Ä
    case 81: return 0.0826231597552956  // Q
    case 119: return 0.141936643553021  // w
    case 225: return 0.07  // á
    case 193: return 0.04  // Á
    case 224: return 0.07  // à
    case 226: return 0.07  // â
    case 197: return 0.04  // Å
    case 87: return 0.111936643553021  // W
    case 113: return 0.112623159755296  // q
    case 83: return 0.0875652329966384  // S
    case 192: return 0.04  // À
    case 97: return 0.03  // a
    case 65: return 0.0  // A
    case 228: return 0.07  // ä
    case 89: return 0.111936643553021  // Y
    case 115: return 0.117565232996638  // s
    case 229: return 0.07  // å
    case 121: return 0.141936643553021  // y
    case 194: return 0.04  // Â
    default: return 1
    }
case 67:  // C
    switch (codeB) {
    case 88: return 0.0796047572696712  // X
    case 86: return 0.0796047572696713  // V
    case 67: return 0.0  // C
    case 68: return 0.101859021498974  // D
    case 99: return 0.03  // c
    case 71: return 0.141894725151684  // G
    case 102: return 0.117103482212508  // f
    case 70: return 0.087103482212508  // F
    case 103: return 0.171894725151684  // g
    case 100: return 0.131859021498974  // d
    case 118: return 0.109604757269671  // v
    case 120: return 0.109604757269671  // x
    default: return 1
    }
case 114:  // r
    switch (codeB) {
    case 232: return 0.119604757269671  // è
    case 233: return 0.119604757269671  // é
    case 234: return 0.119604757269671  // ê
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
    case 114: return 0.03  // r
    case 84: return 0.0796047572696713  // T
    case 82: return 0.0  // R
    case 101: return 0.109604757269671  // e
    case 102: return 0.117103482212508  // f
    case 103: return 0.171894725151684  // g
    case 100: return 0.131859021498974  // d
    case 116: return 0.109604757269671  // t
    default: return 1
    }
case 71:  // G
    switch (codeB) {
    case 72: return 0.0875652329966384  // H
    case 86: return 0.0899664937848628  // V
    case 85: return 0.14844254188022  // U
    case 110: return 0.17844254188022  // n
    case 102: return 0.117565232996638  // f
    case 117: return 0.17844254188022  // u
    case 118: return 0.119966493784863  // v
    case 90: return 0.0934219553527868  // Z
    case 116: return 0.119966493784863  // t
    case 122: return 0.123421955352787  // z
    case 98: return 0.123421955352787  // b
    case 78: return 0.14844254188022  // N
    case 84: return 0.0899664937848628  // T
    case 99: return 0.171894725151684  // c
    case 114: return 0.171894725151684  // r
    case 82: return 0.141894725151684  // R
    case 71: return 0.0  // G
    case 103: return 0.03  // g
    case 104: return 0.117565232996638  // h
    default: return 1
    }
case 101:  // e
    switch (codeB) {
    case 119: return 0.0796047572696713  // w
    case 233: return 0.04  // é
    case 201: return 0.07  // É
    case 202: return 0.07  // Ê
    case 200: return 0.07  // È
    case 114: return 0.0796047572696712  // r
    case 101: return 0.0  // e
    case 102: return 0.135498251499723  // f
    case 232: return 0.04  // è
    case 234: return 0.04  // ê
    case 115: return 0.106720040486886  // s
    case 223: return 0.146720040486886  // ß
    default: return 1
    }
case 220:  // Ü
    switch (codeB) {
    case 252: return 0.03  // ü
    default: return 1
    }
case 69:  // E
    switch (codeB) {
    case 119: return 0.109604757269671  // w
    case 202: return 0.04  // Ê
    case 102: return 0.165498251499723  // f
    case 87: return 0.0796047572696713  // W
    case 70: return 0.135498251499723  // F
    case 100: return 0.114892882921638  // d
    case 83: return 0.106720040486886  // S
    case 201: return 0.04  // É
    case 233: return 0.07  // é
    case 200: return 0.04  // È
    case 114: return 0.109604757269671  // r
    case 82: return 0.0796047572696712  // R
    case 101: return 0.03  // e
    case 115: return 0.136720040486886  // s
    case 232: return 0.07  // è
    case 234: return 0.07  // ê
    case 69: return 0.0  // E
    default: return 1
    }
case 196:  // Ä
    switch (codeB) {
    case 228: return 0.03  // ä
    default: return 1
    }
case 86:  // V
    switch (codeB) {
    case 98: return 0.109604757269671  // b
    case 86: return 0.0  // V
    case 99: return 0.109604757269671  // c
    case 102: return 0.127406836657052  // f
    case 118: return 0.03  // v
    case 103: return 0.119966493784863  // g
    case 104: return 0.17844254188022  // h
    default: return 1
    }
case 106:  // j
    switch (codeB) {
    case 246: return 0.175498251499723  // ö
    case 106: return 0.0  // j
    case 109: return 0.087103482212508  // m
    case 110: return 0.0974068366570524  // n
    case 248: return 0.175498251499723  // ø
    case 111: return 0.135498251499723  // o
    case 117: return 0.0974068366570524  // u
    case 252: return 0.137406836657052  // ü
    case 107: return 0.0875652329966384  // k
    case 249: return 0.137406836657052  // ù
    case 251: return 0.137406836657052  // û
    case 250: return 0.137406836657052  // ú
    default: return 1
    }
case 216:  // Ø
    switch (codeB) {
    case 248: return 0.03  // ø
    default: return 1
    }
case 112:  // p
    switch (codeB) {
    case 248: return 0.119604757269671  // ø
    case 246: return 0.119604757269671  // ö
    case 112: return 0.0  // p
    default: return 1
    }
case 66:  // B
    switch (codeB) {
    case 98: return 0.03  // b
    case 72: return 0.0934219553527867  // H
    case 86: return 0.0796047572696713  // V
    case 78: return 0.0796047572696712  // N
    case 110: return 0.109604757269671  // n
    case 66: return 0.0  // B
    case 71: return 0.0934219553527867  // G
    case 103: return 0.123421955352787  // g
    case 118: return 0.109604757269671  // v
    case 104: return 0.123421955352787  // h
    default: return 1
    }
case 197:  // Å
    switch (codeB) {
    case 229: return 0.03  // å
    default: return 1
    }
case 87:  // W
    switch (codeB) {
    case 97: return 0.141936643553021  // a
    case 119: return 0.03  // w
    case 101: return 0.109604757269671  // e
    case 115: return 0.113386598896635  // s
    case 87: return 0.0  // W
    case 113: return 0.109604757269671  // q
    case 100: return 0.159275587953379  // d
    default: return 1
    }
case 75:  // K
    switch (codeB) {
    case 106: return 0.117565232996638  // j
    case 105: return 0.131859021498974  // i
    case 109: return 0.131859021498974  // m
    case 112: return 0.159275587953379  // p
    case 76: return 0.0875652329966384  // L
    case 79: return 0.0848928829216378  // O
    case 75: return 0.0  // K
    case 77: return 0.101859021498974  // M
    case 107: return 0.03  // k
    case 80: return 0.129275587953379  // P
    case 108: return 0.117565232996638  // l
    case 111: return 0.114892882921638  // o
    default: return 1
    }
case 111:  // o
    switch (codeB) {
    case 214: return 0.07  // Ö
    case 246: return 0.04  // ö
    case 248: return 0.04  // ø
    case 111: return 0.0  // o
    case 216: return 0.07  // Ø
    case 112: return 0.0796047572696713  // p
    default: return 1
    }
case 122:  // z
    switch (codeB) {
    case 249: return 0.119604757269671  // ù
    case 252: return 0.119604757269671  // ü
    case 251: return 0.119604757269671  // û
    case 122: return 0.0  // z
    case 250: return 0.119604757269671  // ú
    default: return 1
    }
case 105:  // i
    switch (codeB) {
    case 246: return 0.119604757269671  // ö
    case 106: return 0.087103482212508  // j
    case 105: return 0.0  // i
    case 248: return 0.119604757269671  // ø
    case 111: return 0.0796047572696712  // o
    case 117: return 0.0796047572696713  // u
    case 252: return 0.119604757269671  // ü
    case 107: return 0.101859021498974  // k
    case 249: return 0.119604757269671  // ù
    case 251: return 0.119604757269671  // û
    case 250: return 0.119604757269671  // ú
    default: return 1
    }
case 84:  // T
    switch (codeB) {
    case 122: return 0.109604757269671  // z
    case 114: return 0.109604757269671  // r
    case 84: return 0.0  // T
    case 102: return 0.127406836657052  // f
    case 103: return 0.119966493784863  // g
    case 116: return 0.03  // t
    case 104: return 0.17844254188022  // h
    case 90: return 0.0796047572696713  // Z
    default: return 1
    }
case 108:  // l
    switch (codeB) {
    case 248: return 0.146720040486886  // ø
    case 111: return 0.106720040486886  // o
    case 246: return 0.146720040486886  // ö
    case 108: return 0.0  // l
    case 112: return 0.0833865988966355  // p
    default: return 1
    }
case 80:  // P
    switch (codeB) {
    case 111: return 0.109604757269671  // o
    case 108: return 0.113386598896635  // l
    case 107: return 0.159275587953379  // k
    case 80: return 0.0  // P
    case 112: return 0.03  // p
    default: return 1
    }
case 88:  // X
    switch (codeB) {
    case 88: return 0.0  // X
    case 99: return 0.109604757269671  // c
    case 89: return 0.0796047572696713  // Y
    case 102: return 0.165498251499723  // f
    case 115: return 0.136720040486886  // s
    case 120: return 0.03  // x
    case 100: return 0.114892882921638  // d
    case 121: return 0.109604757269671  // y
    default: return 1
    }
case 217:  // Ù
    switch (codeB) {
    case 249: return 0.03  // ù
    default: return 1
    }
case 68:  // D
    switch (codeB) {
    case 88: return 0.0848928829216377  // X
    case 119: return 0.159275587953379  // w
    case 68: return 0.0  // D
    case 102: return 0.117565232996638  // f
    case 87: return 0.129275587953379  // W
    case 70: return 0.0875652329966384  // F
    case 120: return 0.114892882921638  // x
    case 100: return 0.03  // d
    case 83: return 0.0875652329966384  // S
    case 114: return 0.131859021498974  // r
    case 99: return 0.131859021498974  // c
    case 89: return 0.129275587953379  // Y
    case 82: return 0.101859021498974  // R
    case 101: return 0.114892882921638  // e
    case 115: return 0.117565232996638  // s
    case 121: return 0.159275587953379  // y
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
    case 106: return 0.03  // j
    case 85: return 0.0974068366570524  // U
    case 110: return 0.127406836657052  // n
    case 74: return 0.0  // J
    case 79: return 0.135498251499723  // O
    case 75: return 0.0875652329966384  // K
    case 77: return 0.087103482212508  // M
    case 107: return 0.117565232996638  // k
    case 111: return 0.165498251499723  // o
    case 117: return 0.127406836657052  // u
    case 105: return 0.117103482212508  // i
    case 78: return 0.0974068366570524  // N
    case 109: return 0.117103482212508  // m
    case 104: return 0.117565232996638  // h
    default: return 1
    }
case 117:  // u
    switch (codeB) {
    case 218: return 0.07  // Ú
    case 217: return 0.07  // Ù
    case 249: return 0.04  // ù
    case 117: return 0.0  // u
    case 252: return 0.04  // ü
    case 220: return 0.07  // Ü
    case 251: return 0.04  // û
    case 219: return 0.07  // Û
    case 122: return 0.0796047572696712  // z
    case 250: return 0.04  // ú
    default: return 1
    }
case 73:  // I
    switch (codeB) {
    case 106: return 0.117103482212508  // j
    case 105: return 0.03  // i
    case 85: return 0.0796047572696713  // U
    case 74: return 0.087103482212508  // J
    case 79: return 0.0796047572696712  // O
    case 73: return 0.0  // I
    case 75: return 0.101859021498974  // K
    case 107: return 0.131859021498974  // k
    case 111: return 0.109604757269671  // o
    case 104: return 0.171894725151684  // h
    case 117: return 0.109604757269671  // u
    default: return 1
    }
case 77:  // M
    switch (codeB) {
    case 106: return 0.117103482212508  // j
    case 78: return 0.0796047572696713  // N
    case 109: return 0.03  // m
    case 110: return 0.109604757269671  // n
    case 77: return 0.0  // M
    case 107: return 0.131859021498974  // k
    case 104: return 0.171894725151684  // h
    default: return 1
    }
case 113:  // q
    switch (codeB) {
    case 119: return 0.0796047572696712  // w
    case 225: return 0.122623159755296  // á
    case 228: return 0.122623159755296  // ä
    case 223: return 0.163253062718541  // ß
    case 226: return 0.122623159755296  // â
    case 224: return 0.122623159755296  // à
    case 115: return 0.123253062718541  // s
    case 229: return 0.122623159755296  // å
    case 113: return 0.0  // q
    default: return 1
    }
case 90:  // Z
    switch (codeB) {
    case 90: return 0.0  // Z
    case 117: return 0.109604757269671  // u
    case 103: return 0.123421955352787  // g
    case 116: return 0.109604757269671  // t
    case 104: return 0.123421955352787  // h
    case 122: return 0.03  // z
    default: return 1
    }
case 219:  // Û
    switch (codeB) {
    case 251: return 0.03  // û
    default: return 1
    }
case 118:  // v
    switch (codeB) {
    case 118: return 0.0  // v
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
    case 98: return 0.109604757269671  // b
    case 106: return 0.127406836657052  // j
    case 78: return 0.0  // N
    case 109: return 0.109604757269671  // m
    case 110: return 0.03  // n
    case 103: return 0.17844254188022  // g
    case 104: return 0.119966493784863  // h
    default: return 1
    }
case 201:  // É
    switch (codeB) {
    case 233: return 0.03  // é
    default: return 1
    }
case 89:  // Y
    switch (codeB) {
    case 115: return 0.113386598896635  // s
    case 97: return 0.141936643553021  // a
    case 120: return 0.109604757269671  // x
    case 100: return 0.159275587953379  // d
    case 121: return 0.03  // y
    case 89: return 0.0  // Y
    default: return 1
    }
case 121:  // y
    switch (codeB) {
    case 225: return 0.151936643553021  // á
    case 228: return 0.151936643553021  // ä
    case 223: return 0.123386598896635  // ß
    case 226: return 0.151936643553021  // â
    case 224: return 0.151936643553021  // à
    case 229: return 0.151936643553021  // å
    case 121: return 0.0  // y
    default: return 1
    }
case 104:  // h
    switch (codeB) {
    case 106: return 0.0875652329966384  // j
    case 110: return 0.0899664937848628  // n
    case 117: return 0.0899664937848628  // u
    case 118: return 0.14844254188022  // v
    case 252: return 0.129966493784863  // ü
    case 251: return 0.129966493784863  // û
    case 116: return 0.14844254188022  // t
    case 122: return 0.0934219553527868  // z
    case 105: return 0.141894725151684  // i
    case 109: return 0.141894725151684  // m
    case 249: return 0.129966493784863  // ù
    case 104: return 0.0  // h
    case 250: return 0.129966493784863  // ú
    default: return 1
    }
case 194:  // Â
    switch (codeB) {
    case 226: return 0.03  // â
    default: return 1
    }
case 214:  // Ö
    switch (codeB) {
    case 246: return 0.03  // ö
    default: return 1
    }
case 85:  // U
    switch (codeB) {
    case 218: return 0.04  // Ú
    case 217: return 0.04  // Ù
    case 106: return 0.127406836657052  // j
    case 85: return 0.0  // U
    case 117: return 0.03  // u
    case 252: return 0.07  // ü
    case 219: return 0.04  // Û
    case 251: return 0.07  // û
    case 90: return 0.0796047572696712  // Z
    case 122: return 0.109604757269671  // z
    case 105: return 0.109604757269671  // i
    case 249: return 0.07  // ù
    case 220: return 0.04  // Ü
    case 103: return 0.17844254188022  // g
    case 104: return 0.119966493784863  // h
    case 250: return 0.07  // ú
    default: return 1
    }
case 202:  // Ê
    switch (codeB) {
    case 234: return 0.03  // ê
    default: return 1
    }
case 76:  // L
    switch (codeB) {
    case 112: return 0.113386598896635  // p
    case 76: return 0.0  // L
    case 79: return 0.106720040486886  // O
    case 111: return 0.136720040486886  // o
    case 108: return 0.03  // l
    case 107: return 0.117565232996638  // k
    case 80: return 0.0833865988966355  // P
    default: return 1
    }
case 102:  // f
    switch (codeB) {
    case 233: return 0.175498251499723  // é
    case 114: return 0.087103482212508  // r
    case 102: return 0.0  // f
    case 118: return 0.0974068366570523  // v
    case 232: return 0.175498251499723  // è
    case 234: return 0.175498251499723  // ê
    case 103: return 0.0875652329966384  // g
    case 116: return 0.0974068366570524  // t
    case 120: return 0.135498251499723  // x
    default: return 1
    }
case 79:  // O
    switch (codeB) {
    case 214: return 0.04  // Ö
    case 246: return 0.07  // ö
    case 106: return 0.165498251499723  // j
    case 105: return 0.109604757269671  // i
    case 216: return 0.04  // Ø
    case 112: return 0.109604757269671  // p
    case 248: return 0.07  // ø
    case 111: return 0.03  // o
    case 79: return 0.0  // O
    case 108: return 0.136720040486886  // l
    case 107: return 0.114892882921638  // k
    case 80: return 0.0796047572696713  // P
    default: return 1
    }
case 70:  // F
    switch (codeB) {
    case 88: return 0.135498251499723  // X
    case 86: return 0.0974068366570523  // V
    case 102: return 0.03  // f
    case 118: return 0.127406836657052  // v
    case 70: return 0.0  // F
    case 120: return 0.165498251499723  // x
    case 100: return 0.117565232996638  // d
    case 116: return 0.127406836657052  // t
    case 84: return 0.0974068366570524  // T
    case 114: return 0.117103482212508  // r
    case 99: return 0.117103482212508  // c
    case 82: return 0.087103482212508  // R
    case 101: return 0.165498251499723  // e
    case 71: return 0.0875652329966384  // G
    case 103: return 0.117565232996638  // g
    default: return 1
    }
case 107:  // k
    switch (codeB) {
    case 246: return 0.124892882921638  // ö
    case 109: return 0.101859021498974  // m
    case 112: return 0.129275587953379  // p
    case 248: return 0.124892882921638  // ø
    case 111: return 0.0848928829216378  // o
    case 108: return 0.0875652329966384  // l
    case 107: return 0.0  // k
    default: return 1
    }
case 100:  // d
    switch (codeB) {
    case 234: return 0.124892882921638  // ê
    case 119: return 0.129275587953379  // w
    case 114: return 0.101859021498974  // r
    case 233: return 0.124892882921638  // é
    case 223: return 0.127565232996638  // ß
    case 101: return 0.0848928829216378  // e
    case 102: return 0.0875652329966384  // f
    case 115: return 0.0875652329966384  // s
    case 120: return 0.0848928829216377  // x
    case 100: return 0.0  // d
    case 121: return 0.129275587953379  // y
    case 232: return 0.124892882921638  // è
    default: return 1
    }
case 116:  // t
    switch (codeB) {
    case 116: return 0.0  // t
    case 122: return 0.0796047572696713  // z
    default: return 1
    }
case 192:  // À
    switch (codeB) {
    case 224: return 0.03  // à
    default: return 1
    }
case 97:  // a
    switch (codeB) {
    case 196: return 0.07  // Ä
    case 119: return 0.111936643553021  // w
    case 225: return 0.04  // á
    case 223: return 0.127565232996638  // ß
    case 193: return 0.07  // Á
    case 224: return 0.04  // à
    case 226: return 0.04  // â
    case 197: return 0.07  // Å
    case 113: return 0.0826231597552956  // q
    case 192: return 0.07  // À
    case 97: return 0.0  // a
    case 228: return 0.04  // ä
    case 115: return 0.0875652329966384  // s
    case 229: return 0.04  // å
    case 121: return 0.111936643553021  // y
    case 194: return 0.07  // Â
    default: return 1
    }
case 200:  // È
    switch (codeB) {
    case 232: return 0.03  // è
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
    case 119: return 0.0833865988966355  // w
    case 225: return 0.127565232996638  // á
    case 223: return 0.04  // ß
    case 226: return 0.127565232996638  // â
    case 224: return 0.127565232996638  // à
    case 120: return 0.106720040486886  // x
    case 233: return 0.146720040486886  // é
    case 228: return 0.127565232996638  // ä
    case 115: return 0.0  // s
    case 229: return 0.127565232996638  // å
    case 232: return 0.146720040486886  // è
    case 234: return 0.146720040486886  // ê
    case 121: return 0.0833865988966354  // y
    default: return 1
    }
case 103:  // g
    switch (codeB) {
    case 250: return 0.18844254188022  // ú
    case 251: return 0.18844254188022  // û
    case 114: return 0.141894725151684  // r
    case 110: return 0.14844254188022  // n
    case 249: return 0.18844254188022  // ù
    case 117: return 0.14844254188022  // u
    case 118: return 0.0899664937848628  // v
    case 103: return 0.0  // g
    case 252: return 0.18844254188022  // ü
    case 116: return 0.0899664937848628  // t
    case 104: return 0.0875652329966384  // h
    case 122: return 0.0934219553527868  // z
    default: return 1
    }
case 81:  // Q
    switch (codeB) {
    case 97: return 0.112623159755296  // a
    case 119: return 0.109604757269671  // w
    case 115: return 0.153253062718541  // s
    case 87: return 0.0796047572696712  // W
    case 113: return 0.03  // q
    case 83: return 0.123253062718541  // S
    case 81: return 0.0  // Q
    default: return 1
    }
default: return 1
}
}
