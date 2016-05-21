# HelloEdison
C# program that blinks the onboard LED using my C# bindings to Intel's libmraa. Should also be workable with Raspberry Pi's, Beaglebones, and MinnowBoards.

# Note
You need to `opkg install mono` on your Yocto-based device before this will run. I'm currently working on getting `mkbundle` to cross-compile into a static executable.
