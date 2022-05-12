# SnakeAI

SnakeAI : Processing 3.5.4 : Java

I started this project last summer, with my goal to create a snake that could play and beat the game, snake. 
I went through and coded out two plans for the AI (slides 7-8) before finally settling on a third, very different plan (slide 6) 
after a very long break (I had school and crew). The final plan and redesigning, coding and bug fixing for the third AI model 
took me about 3 days to work through.

As for the code:
Originally my AI was modeled around the snake’s behavior when traversing it’s own body. My 2 models were made to simply help the snake
traverse its own body when it got longer and needed to. It worked for early game, but once the snake got longer it became confused and
wouldn’t think about the long term, often ending up trapping itself. The algorithm I settled on that beat the 40x40 grid was inspired by
the Hamiltonian cycle, a cycle where a path is found in which any given space is only passed through once. My algorithm utilizes elements
of the cycle in the way that it uses the swinglen cycle (slide 6) to ensure its safety as it gets longer, but what makes my version more
efficient than the cycle is the use of the firstloop and secondloop algorithms, allowing the snake to seek out apples that may be far from
it while still ensuring that it won’t hit or trap itself. 

It takes the snake about 1.5 hours to fill the 40x40 square (most of the time is spent displaying). This was a lot of fun to finish and
starting fresh after all the time I spent on it last year was very refreshing. I’ve had to delete and rewrite over 500 lines of code for
this program with rewriting and making new algorithms and plans but I’m really happy with how it turned out.

Lines of Code: ~500
Hours spent: ~50

Feel free to reach out if you have any questions.
