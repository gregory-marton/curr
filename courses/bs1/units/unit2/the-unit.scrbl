#lang curr/lib

@declare-tags[group pedagogy selftaught]
@title{Unit 2: Contracts, Strings and Images}
Unit Overview:



Students are introduced to a set-mapping representation for functions, in which the function object exists as a means of translating points
from a Domain into a Range. Coupled with their understanding of Circles of Evaluation, students generalize their understanding of functions to
include other datatypes, including Strings and Images. 

@agenda[
@item{25 min Introduction} @; LINKY?
@item{15 min Contracts}
@item{10 min Strings}
@item{35 min Creating Images}
@item{5 min Closing}
]

@objectives[@item{Learn Racket syntax and grammar, using the Circle of Evaluation}
        @item{Learn how to define values to be used later, as variables}
        @item{Learn syntax for simple strings and image-composition expressions}]
@product-outcomes[
        @item{Students learn to make and manipulate the basic elements of their games--numbers, strings, and images}]
See @(hyperlink "http://insertlinkhere.com" "Bootstrap Standards Matrix") for State Standards


Length: 90 minutes
@tag[pedagogy]{
@materials[@item{Student workbook folders @tag[group]{- in pairs! - with names on folders}}
            @item{Pens/pencils for the student@tag[group]{s, fresh whiteboard markers for the teachers}}
            
            @;How to make an entire item tagged?
            @item{@tag[group]{Class posters (List of rules, language table, course calendar)}}
            @item{Language Table (See below)}
            ]
@preparation[@item{Write agenda on board}
             @item{Display class posters and Language Table}
             @item{Seating arrangements: ideally with clusters of desks/tables}
             @item{Optional: demo machine with projector to show the interactions and definitions windows}]}

@(language-table (list "Number" "+ - * / sq sqrt expt"))


@(include-section "../../../../lessons/Chapter-2-Intro/lesson/lesson.scrbl")

@(include-section "../../../../lessons/Contracts/lesson/lesson.scrbl")

@(include-section "../../../../lessons/Strings/lesson/lesson.scrbl")

@(include-section "../../../../lessons/Creating-Images/lesson/lesson.scrbl")
                                


@lesson[#:title "Closing"
        #:duration "5 minutes"]{
    @tag[pedagogy]{@itemlist[@item{Who can tell us one thing we learned today?}
                             @item{Who saw someone else in the class do something great?}
                             @item{Cleanup, dismissal.}]}
    @tag[selftaught]{@itemlist[@item{Think about what you learned today.}
                               @item{Remember contracts and how to make them.}
                               @item{Think of strings and what differentiates a string from a different type.}
                               @item{Think about images and what goes into creating an image.}
                               @item{Have an awesome day!}]}}