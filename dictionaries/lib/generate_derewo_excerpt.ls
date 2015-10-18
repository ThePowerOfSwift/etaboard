require! {
    ramda:r
    './util': u
    './derewo'
}

splitLines = r.split('\n')
joinLines = r.join('\n')

[source, sink] = process.argv[2, 3]

u.readFile source
.then splitLines
.then r.flip(derewo.excerpt)(maxFrequencyClass: 15)
.then joinLines
.then u.writeToFile sink
.done()
