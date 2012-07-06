#lang curr/lib
@(require 2htdp/image)

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Creating Images"
        #:duration "35 minutes"
        #:prerequisites "Introducing-the-Design-Recipe"]{
@itemlist/splicing[
          @item{Let's talk about graphics.}
          @tag[pedagogy]{@item{On the board, draw the Circle of Evaluation for 
                                 @code{(circle 50 "solid" "red")}}}
          @tag[selftaught]{@item{@bitmap{images/2.2.png} Take a look at this Circle of Evaluation}}
          @tag[pedagogy]{@item{Can someone tell me how to convert this into Racket code? Copy their answer on the board.}}
          @tag[selftaught]{@item{@think-about[#:question "How would you convert this to racket code? Check your answer below."
                                                                     #:answer @code{(circle 50 "solid" "red")}]}}
          @item{This uses a new function, which you've never seen before! What is its name?}
          @item{Every contract has three parts! @tag[pedagogy]{Raise your hand if you can tell me what they are! (Name, domain, and range)}
                       @tag[selftaught]{@think-about[#:question "What are they?"
                                                    #:answer "Name, domain, and range"]}}
           @item{Can you figure out the contract for circle? Based on the example, can you tell me what's in its Domain?@tag[pedagogy]{ Follow along on the board... @linebreak[]
                @code[#:contract "circle: Number String String -> ..."] @linebreak[]
                @code{(circle 50 "solid" "red")}}}
          @item{So what's the Range? What do you think this thing is going to give us back? A Number? A String? Type it in and try it out! @tag[selftaught]{@embedded-wescheme[#:id "Images1"
                   #:interactions-text "; Try out the images!"
                   #:hide-definitions? #t]}}

           @item{What it gives back is a new Type: Image!}
           @tag[group]{@item{Now we're going to do the next step as a group.}}
           @item{@exercise{I'm going to show you the contract for another function. This time around, you're not allowed to touch the keyboard until you have copied the contract into your contract table, along with the contract for circle. Once you've done that, @tag[pedagogy]{"I want to see you "}try to draw a rectangle! GO!} @code[#:contract "rectangle: Number Number String String -> Image"]}
           @item{@exercise{I'm going to show you a few more contracts. Once again, you have to have them written down before touching the keys. You'll have five minutes to figure out how to use each of these functions to make a shape! GO!}
                  @code[#:contract "ellipse: Number Number String String -> Image"] @linebreak[]
                  @code[#:contract "triangle: Number String String -> Image"] @linebreak[]
                  @code[#:contract "star: Number String String -> Image"] @linebreak[]
                  @code[#:contract "radial-star: Number Number Number String String -> Image"] @linebreak[]
                  @code[#:contract "text: String Number String -> Image"]
                        } 
           @tag[pedagogy]{@item{Let kids experiment with these functions and point out interesting results to the class.}}
           @tag[selftaught]{@item{Experiment with these functions!
                 @embedded-wescheme[#:id "Images"
                   #:interactions-text ""
                   #:hide-definitions? #t]}}
           @item{Going Further - If time allows, you can go further into @(hyperlink "../../Manipulating-Images/lesson/lesson.html" "Manipulating Images") or @(hyperlink "../../Making-Flags/lesson/lesson.html" "Making Flags")!}
           ]}

