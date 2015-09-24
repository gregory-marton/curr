#lang curr/lib

@title{Unit 6: Key Events}
@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt num-expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
                                                                  @unit-descr{Students return to the subject of piecewise functions, this time defining a key-event handler that modifies their world when certain keys are pressed.}
}
@unit-lessons{
@lesson/studteach[#:title "Introduction"
        #:duration "15 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, design recipe, course calendar)}
                            @item{Editing environment (Pyret Editor)}
                            @item{Student workbooks}
                            @item{Language Table}]
     #:preparation @itemlist[@item{Seating arrangements: ideally clusters of desks/tables}
                             @item{The @editor-link[#:public-id "0B9rKDmABYlJVaV9FRlpZcER0WDg" "Ninja World 3"] file projected onto the board}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Think about the person playing your videogame. How will they control the game? What key will make your player move up? Down? What else can they do? Move side-to-side? Jump? Teleport? In Bootstrap:1, your target and danger could only move left and right, and without structures your player could only move up and down. Now that @italic{you} write and control your own game World structure, you can make any game element update in nearly any way in response to any key. Structures have opened up whole new worlds (pun intended!) in Bootstrap:2!
                                
                                                     @activity{Turn to @worksheet-link[#:page 24 #:name "Lesson 6"] in your workbooks.
                                                                   Write down the various keys that the user can hit to control the game. 
                                                                   For each one, write down the field in your world struct that changes, 
                                                                   and how it changes.}}
                        @teacher{Review students' workbook pages, and check for understanding: could they change multiple things in their game
                                 with one keypress?}}
                 @point{@student{So far, we've been working with three main functions to make our game and animate our world: @code{next-world}, 
                                @code{draw-world}, and @code{big-bang}. At this point, your game might use a few more functions than these, but 
                                Ninja World has been pretty basic so far, and it's not interactive. Time to change that!
                                @activity{@itemlist[@item{Open the @editor-link[#:public-id "0B9rKDmABYlJVaV9FRlpZcER0WDg" "Ninja World 3"]
                                                         file and press "Run".}
                                                     @item{With your mouse, highlight the data definition for our world structure.} 
                                                     @item{What's new in this definition, compared to what we saw before? What do you think they represent?}
                                                     @item{What new dot-accessors do we have, to access the new elements of our world struct?}
                                                     @item{What is the contract for each of the functions in this game? What do they do?}
                                                     @item{Scroll down to the definition of @code{next-world}. Each time the function is called, 
                                                           what changes about the dog? @italic{How} does it change? What about the coin? The cat?}
                                                     @item{Scroll down to the definition of @code{draw-world}. Where does this function put the 
                                                           image of the dog? the coin? The cat?}]}
                                In this version of Ninja World, both the dog and the coin are moving as they should. But that's old news: you've already 
                                made the characters in your game move on their own. Let's add more!}
                        
                        @teacher{}}
                 
                 @point{@student{In this version of the game, we see something new on the screen: Ninja Cat! If you press the up arrow key, she'll 
                                 move up... but nothing happens when you press the down arrow key! Let's fix that.
                                 @activity{@itemlist[@item{Scroll down to where it says @code{# KEY EVENTS} in your code.}
                                                      @item{What is the name of the function defined here? What is its Domain? Its Range?}
                                                      @item{How does @code{keypress} change the world it takes in? What happens on screen as a
                                                            result of pressing certain keys?}
                                                      @item{Right now this function only checks whether the key pressed by the player is the 'up'
                                                            arrow key. But how can we get it to check if the 'down'arrow key was pressed, and
                                                            move the cat accordingly? Take a few minutes with your partner to write one more 
                                                            line of code inside the @code{keypress} function to make the player move down.}]}}
                         @teacher{Some students may struggle with this, as they're seeing brand new syntax for the first time. Remind them that
                                  this is similar to the @code{keypress} function they wrote in Bootstrap:1, give them a few minutes to work on
                                  it, and move on to debrief.}}]}
      
       
@lesson/studteach[#:title "Keypress in Ninja World"
        #:duration "20 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will extend their understanding of events to cover key-events}
            @item{Students will deepen their knowledge of conditionals, by combining them with struct accessor and constructor functions.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{The @code{keypress} function behaves similarly to the @code{update-player} function you remember from Bootstrap:1. 
                                    It takes in a world and a string (representing the name of a key pressed), and moves the player depending on that string.
                                    In Pyret, instead of using @code{cond} branches, we use a keyword called @code{ask}, which lets the computer know whe're going 
                                    to have different situations and behavior in our code. Just  like you learned in Bootstrap:1, this is known 
                                    as a @vocab{Piecewise function}. Each ask statement starts with the '|' key, (known as 'pipe') followed by a test, 
                                    or an expression that produces a @vocab{Boolean} (either true or false). The other keyword to know here is 
                                    @code{then:}. This tells the computer that whatever follows is what will be returned if the preceding expression 
                                    is @bold{true}. In the case of this function, if the string representing the key pressed (@code{key}) is equal 
                                    to the string "up" (@code{string-equal(key, "up")}), @italic{then} the function will return a world which is the 
                                    same as the input world, but with the cat's y-coordinate (@code{current-world.catY}) increased by 10 pixels.}
                        @teacher{@code{string-equal} is exactly the same as @code{string=?} in Racket. Have students copy the contract for this function
                                  into their contracts page.}}
                 @point{@student{After adding a line to make Ninja Cat move down, your @code{keypress} function should look something like this:
@code[#:multi-line #t]{# keypress : World, String -> World
# Make cat respond to key events
fun keypress(current-world, key):
  ask:
    | string-equal(key, "up") then: 
      world(current-world.dogX, current-world.coinX, current-world.catX, current-world.catY + 10)
    | string-equal(key, "down") then: 
      world(current-world.dogX, current-world.coinX, current-world.catX, current-world.catY - 10)
    | otherwise: current-world
  end
end}
In Racket we had an @code{else} clause, that would return true when all other tests had failed. In Pyret, we have the @code{otherwise:} 
keyword, which behaves the same way. If we didn't have this line of code our game would crash if someone pressed any key but 'up' or 'down'. 
This way, if you accidentally press another key, the function returns w: the @italic{same world} we gave the function originally.}
                         @teacher{@code{otherwise} clauses are best used as a catch-all for cases that you can’t otherwise enumerate. If you can state a precise 
                                   question for a clause, write the precise question instead of otherwise. For example, if you have a function that does
                                   different things depending on whether some variable @code{x} is larger than @code{5}, it is better for beginners to
                                   write the two questions @code{(> x 5)} and @code{(<= x 5)} rather than have the second question be @code{otherwise}. 
                                   Explicit questions make it easier to read and maintain programs. When you use @code{otherwise}, someone has to read
                                   all the previous questions to know what condition else corresponds to: they can’t just skim all the questions 
                                   to find the one that matches their situation. This makes code more readable and understandable.}}
                 @point{@student{At the end of the file, there's one more bit of code that makes the game respond to key presses. Inside of @code{big-bang}, 
                                 the very last line reads @code{on-key(keypress)}. @code{on-key} is a special function that detects when the user has pressed
                                 any key, and its argument tells it which function will handle the user input (in this case, @code{keypress}!). Now 
                                 @code{big-bang} has all the information it needs to manage the state of this game: @code{on-tick}, which tells the computer 
                                 which function updates the game on every "tick" of a timer, @code{to-draw}, which tells it what function to use to draw the 
                                 world, and finally, @code{on-key}, which handles user input.}
                         @teacher{}}]}
                                 

@lesson/studteach[#:title "Extending Keypress"
        #:duration "15 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{We've made Ninja Cat move up and down, but in the original version of the game she moved left and right as well. Now
                                that you're familiar with data structures, this is easy! 
                                @activity{@itemlist[@item{What changes about the cat if she moves to the left? To the right? What part of the world is that?}
                                                     @item{How would you change your @code{keypress} function so it also asks whether the player has
                                                           pressed the "left" or "right" arrow keys?}
                                                     @item{What would you change about the world if the player presses the left arrow key? The right?}
                                                     @item{Change your @code{keypress} function so that the cat moves left and right based on the arrow keys.}]}
When finished, your code should look like: 
@code[#:multi-line #t]{# keypress : World, String -> World
# Make cat respond to key events
fun keypress(current-world, key):
  ask:
    | string-equal(key, "up") then: 
      world(current-world.dogX, current-world.coinX, current-world.catX, current-world.catY + 10)
    | string-equal(key, "down") then: 
      world(current-world.dogX, current-world.coinX, current-world.catX, current-world.catY - 10)
    | string-equal(key, "left") then: 
      world(current-world.dogX, current-world.coinX, current-world.catX - 10, current-world.catY)
    | string-equal(key, "right") then: 
      world(current-world.dogX, current-world.coinX, current-world.catX + 10, current-world.catY)
    | otherwise: current-world
  end
end}
For reference and to check your work, you can see the completed Design Recipe for @code{keypress} in Ninja World on @worksheet-link[#:page 26 #:name "Keypress-in-Ninja-World"].
}
                        @teacher{}}]}           
     
@lesson/studteach[#:title "Keypresses in Your Game"
        #:duration "35 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Using conditionals, students will write a function to handle different keypresses in their game.}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Now it's time to program YOUR game to respond to keypresses. 
                                @activity{Turn to @worksheet-link[#:page 27 #:name "Keypress-in-Game"] in your workbook. Choose 3 
                                           keys that control the game, and go through the design recipe: Write test cases for what should 
                                           happen to your START world depending on which key was pressed. Then define your function. Once
                                           you've completed the Design Recipe, type your @code{keypress} function into your games.}

                                  Of course, keypresses can do a lot more in a videogame than just move a character up and down. By using what
                                  your learned about Boolean functions, you can add more advanced movement. Here are some ideas:
@itemlist[
          @item{@bold{Warping:} instead of having the player’s y-coordinate change by adding or subtracting, replace it with a Number to 
                 have the player suddenly appear at that location. (For example, hitting the @code{"c"} key causes your player to warp back
                 to the center of the screen, at y=240.)}
          @item{@bold{Boundary-detection:} Change the condition for moving up so that the player only moves up if @code{key} = @code{"up"} 
                 AND the player's y-coordinate is less than @code{480}. Likewise, change the condition for @code{"down"} to also check 
                 that the player's y-coordinate is greater than 0.}
          @item{@bold{Wrapping:} Add a condition (before any of the keys) that checks to see if the player’s y-coordinate is above 
                 the screen @code{(> y 480)}. If it is, have the player warp to the bottom. Add another condition so that the player 
                 warps back up to the top of the screen if it moves below the bottom.}
          @item{@bold{Challenge:} Have a character hide when the @code{"h"} key is pressed, only to re-appear when it is pressed again.}]
}
                         @teacher{Hint for the challenge: multiply by -1!
                                  For optional practice with piecewise functions, have students complete the Design Recipe for @code{red-shape} on @worksheet-link[#:page 30 #:name "Red-shape"].}}
                 ]
         }       
@lesson/studteach[#:title "Closing"
        #:duration "5 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[@item{}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{With @vocab{piecewise functions}, you can make a lot of things happen in your 
                                     game with just a few lines of code, like controlling the movement of characters. Speaking of 
                                     controlling characters, what happens in Ninja World when the dog and coin go off the screen? 
                                     They keep going, but don't come back - the same problem we had in Bootstrap:1! If you 
                                     need a refresher on how to fix it, that's what we'll be covering in the next unit.}
                       @teacher{Have students show each other their (controllable games).}}
                 ]
         }
       }

       