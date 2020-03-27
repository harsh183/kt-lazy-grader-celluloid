# Lazy grader using Celluloid Futures

Similar to some of the work I have done with grading student work often get overloaded as loads are mostly in sharp spikes and almost no activity. Here my goal is that code test case grades are lazily evaluated only when they are viewed using `Celluloid` actors and futures. The proof of concept will be based off Kotlin testing code on top of an existing Kotlin playground from UIUC but the idea is general enough in any case.


