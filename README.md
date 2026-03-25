# us-layout-italian-accents

For every Italian developer who spends the day writing code in English and still needs to reply to their mum on WhatsApp in Italian.

This is an AutoHotkey v2 script that adds Italian accent input to Windows when using US Standard keyboard layout.

## Why not just use the US International layout?

The US International layout supports accented characters, but it turns `"`, `'`, and `` ` `` into dead keys. They no longer type immediately and instead wait for the next keystroke to form an accented character. For developers, this is a constant source of friction since these characters appear everywhere in code.
This script keeps the standard US layout untouched and adds accent support only when you explicitly trigger it, so your coding workflow is completely unaffected.

## How it works

### Grave accent (à è ì ò ù)

Press `Alt + ` ` (backtick), release both keys, then press a vowel to get the grave accented version. The script waits up to 2 seconds for the next key. If no key is pressed, it outputs a literal backtick.

| Sequence | Output |
|----------|--------|
| `Alt + ` ` then `a` | à |
| `Alt + ` ` then `e` | è |
| `Alt + ` ` then `i` | ì |
| `Alt + ` ` then `o` | ò |
| `Alt + ` ` then `u` | ù |
| `Alt + ` ` then `A` | À |
| `Alt + ` ` then `E` | È |
| `Alt + ` ` then `I` | Ì |
| `Alt + ` ` then `O` | Ò |
| `Alt + ` ` then `U` | Ù |
| `Alt + ` ` then anything else | ` + character |
| `Alt + ` ` then nothing (Esc or timeout) | ` |

### Acute accent (é)

Press `Alt + ' ` (single quote), release both keys, then press the vowel to get the acute accented version.

| `Alt + '` then `e` | é |
| `Alt + '` then `E` | É |
| `Alt + '` then anything else | ' + character |
| `Alt + '` then nothing | ' |

## Requirements

- Windows
- US Standard layout enabled
- [AutoHotkey v2](https://www.autohotkey.com/)

## Installation

1. Install AutoHotkey v2
2. Download `script-italian-accents`
3. Double-click the file to run it

## Run at startup

Press `Win + R`, type `shell:startup` and press Enter. Create a shortcut to `script-italian-accents` in the folder that opens. The script will run automatically on every login.

## The script

```ahk
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
```

## License

MIT