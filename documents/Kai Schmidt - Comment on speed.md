Most of the array operations are pretty optimized. For things like doing math on arrays, reducing, scanning, etc, it should have near-C performance, at least for large arrays, as that stuff all happens in tight optimized loops.
Believe it or not, I intend it to eventually be pretty general purpose.
For example, in the repository, there is an example of a simple multithreaded http server that is good enough to serve the website.
The language natively supports image and audio encoding/decoding.
There are some system APIs I haven't added hooks into yet, but they're on the todo.