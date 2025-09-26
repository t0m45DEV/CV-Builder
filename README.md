# CV-Builder

Are you the type of programmer that makes lots of CVs? Maybe some for developer, some for game design, some more academic...

And also, do you like Latex?

Stop frustrating, my friend, I have your back.

Behold the CV-Builder (or CVB, for short). This project make not one, not two, but TWELVE different CVs.

## How it works

The logic is pretty simple.

For starters, we have two templates: academic (or Harvard-style) and colorful. The first one make a CV in a bullet list fashion, all black and white (besides from your photo); the other one make a color boxes fashion, with different columns. We could make more templates, so for future porpuses let's call the template ammount $s$.

All your info will be saved in the `info` folder (surprise). There'll be $l$ folders, where $l$ is the ammount of languages you want the CVs to be exported. In the current repo you have two already displayed: english and spanish.

Inside every language folder is the common info across all CVs, and also a couple of folders. This folders (let's call this ammount $m$) will be the different modes (or approachs) of the CVs. For example, in the current repo there are three different modes: dev, game dev and professor.

The `Makefile` is the responsible of all the magic. Basically, the command `make all` will make a CV for every style, in every language, with every approach that you wrote, that is $s * l * m$ CVs!

For example, in the current repo we have 3 modes ($m = 3$), 2 languages ($l = 2$), and also 2 templates (so $s = 2$). In the end, we'll have $s * l * m = 2 * 2 * 3 = 12$, and there you have it.
