!`:: {
    ih := InputHook("L1 T2", "{Esc}")
    ih.Start()
    ih.Wait()
    
    char := ih.Input
    accents := Map(
        "a", "{U+00E0}", 
        "e", "{U+00E8}", 
        "i", "{U+00EC}", 
        "o", "{U+00F2}", 
        "u", "{U+00F9}",
        "A", "{U+00C0}",
        "E", "{U+00C8}",
        "I", "{U+00CC}",
        "O", "{U+00D2}",
        "U", "{U+00D9}"
    )
    
    if accents.Has(char)
        Send(accents[char])
    else if (char = "")
        Send("{U+0060}")
    else
        Send("{U+0060}" char)
}

!':: {
    ih := InputHook("L1 T2", "{Esc}")
    ih.Start()
    ih.Wait()

    char := ih.Input
    accents := Map(
        "e", "{U+00E9}",
        "E", "{U+00C9}"
    )

    if accents.Has(char)
        Send(accents[char])
    else if (char = "")
        Send("'")
    else
        Send("'" char)
}