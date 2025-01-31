data class TestResult(var score: Double, var maxScore: Double)
data class Case(val name: String, val weight: Double = 1.0, val code: () -> Boolean) {
    fun test(): TestResult {
        val result = code()
        val resultDisplay = if (result) "PASSED" else "FAILED"
        println("TEST $name -> $resultDisplay ($weight)")

        val score = if (result) weight else 0.0
        return TestResult(score, weight)
    }
}

fun runCases(cases: List<Case>) {
    println("Running tests")
    val (score, totalScore) = sumScore(cases)
    println("Got $score / $totalScore")
}

fun sumScore(cases: List<Case>): Pair<Double, Double> {
    var score: Double = 0.0
    var totalScore: Double = 0.0
    cases.forEach {
        val result = it.test()
        score += result.score
        totalScore += result.maxScore
    }
    return Pair(score, totalScore)
}
