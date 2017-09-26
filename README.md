# Pitch-Perfect

App for record audio and play it with some effect.

### RecordSoundsViewController

Clear layout with only two buttons, for start record and stop.
When user tap on stop button app open the second ViewController (PlaySoundsViewController)

### PlaySoundsViewController
This layout display seven button: six for sound effects and one for stop player.
Effects are: 
- play slow
- play fast
- custom pitch (1000) like a chipmunk voice
- custom pitch (-1200) like a vader voice
- echo
- reverb

When user tap on back button on NavigationBar, app stop the player for prevent to record played audio on new record.

## Requirements

- Xcode Xcode 9.0
- Swift 4.0

## License

Copyright (c) 2017 Alessandro Bellotti

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
