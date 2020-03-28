// exmaple
fun main() {
    val cases = listOf(
        Case("[1,2]=2", 2.0) {
            multiply(listOf(1, 2)) == 2
        },

        Case("[5]=5", weight=0.25) {
            multiply(listOf(5)) == 5
        }
    )

    runCases(cases)
}
