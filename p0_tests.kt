// exmaple
fun main() {
    val cases = listOf(
        Case("5 + 10", 2.0) {
            var x = 15;
            x = x + 10
            add(5, 10) == x
        },

        Case("10 + 15", weight=0.25) {
            add(10, 15) == 25
        },

        Case("Negative") {
            add(10, -15) == -5
        },

        Case("Zero", 10.0) {
            add(10, 0) == 10
        }
    )

    runCases(cases)
}


