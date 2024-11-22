## Types in Programming 

In programming, types are the classification of data (this defines the kind of values that variables will hold)

Common Types:
- Composite Types: Arrays, tuples, and dictionaries.
- Abstract Types: Classes, objects, and user-defined types that encapsulate data and behavior
- Primitive Types: The "basic" data types (ints, floats, booleans, and chars).

Normal Racket = Dynamically Typed which means things get checked at runtime (errors only appear when program is executed).
- - More focused on ease of use
Typed Racket = Statically Typed which means types are checked at compile time. Type errors are caught before the program runs.
- - More focused on safety and performance
 
Typed Languages can be STATIC or DYNAMICALLY Typed. 
Examples of Static typed laguages I've used (where the type declarations are required at *compile time*):
  Java, C (where the types for variables (ex: int, float, char) are declared and function signatures are declared explicitly
Examples of Dynamically typed languages I've used (where the prgramming languages will determine the type of variables at *runtime*):
  Python

In short: 
Static typed = compile type and types for variables are explicity stated
Dynamically typed = runtime 


----------
Reflections on "The good and the bad of Typed Racket" (https://www.micahcantor.com/blog/thoughts-typed-racket/):

Typed Racket can make use of any Racket libraries or interface with existing Racket code. 
To change from Racket to Typed Racket: 
- go from #lang to # lang typed/racket

Answers to class questions: 
Have you used types in other languages? Yes.
If so, what languages? Java, C, and Python most recently.
Do types make sense to you?  Sometimes it seems easier to leave everything untyped and just use logic to check if your inputs or outputs are correct.
How do you think types can save you time? Types can save time because they explicitly declare what the type of the variable is. Declaring types may assist in identifying errors. Additionally, a big benefit of typed Racket is you can import any Racket libraries or interface with existing Racket code.
