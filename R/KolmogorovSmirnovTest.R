
#' PRIVATE class : An S4 class to represent a ranked based tests in Mulea.
#'
#' @slot gmt A data.frame representing GMT's reprezentation of model.
#' @slot testData A data from expeciment to analize accross model.
#' @slot numberOfPermutations A number of permutations used in renked test.
#' @return KolmogorovSmirnovTest object. Used as private object.
#' @examples
#' \dontrun{
#' #It is a private s4 object. Look at SetBasedTest's examples.
#' }
KolmogorovSmirnovTest <- setClass("KolmogorovSmirnovTest",
                                  slots = list(
                                    gmt = "data.frame",
                                    testData = "character",
                                    numberOfPermutations = "numeric",
                                    test = "function"
                                  ))

setMethod("initialize", "KolmogorovSmirnovTest",
          function(.Object,
                   gmt = data.frame(),
                   testData = character(),
                   numberOfPermutations = 1000,
                   test = NULL,
                   ...) {

            .Object@gmt <- gmt
            .Object@testData <- testData
            .Object@numberOfPermutations <- numberOfPermutations

            .Object@test <- function(testObject) {
              pvalues <- sapply(testObject@gmt$listOfValues,
                                function(categoryValues) {
                                  matchedFromModel <- match(categoryValues, testObject@testData)
                                  matchedFromModelDist <- matchedFromModel[!is.na(matchedFromModel)]
                                  if (length(matchedFromModelDist) == 0) {
                                    return(NA)
                                  }
                                  pvaluesFromPermutationTest <- aaply(.data = 1:testObject@numberOfPermutations, .margins = 1, .fun = function(element) {
                                    randomFromExperimentDist <- sort(sample(seq_len(length(testObject@testData)), length(matchedFromModelDist)))
                                    ks.test(matchedFromModelDist, randomFromExperimentDist)$p.value
                                  })
                                  mean(pvaluesFromPermutationTest)
                                })
              resultDf <- data.frame(testObject@gmt, "p.value" = pvalues)
              resultDf
            }

            .Object

          })

#' @describeIn KolmogorovSmirnovTest runs test calculations.
#' @param testObject Object of s4 class represents Mulea Test.
#' @return runTest method for KolmogorovSmirnovTest object. Used as private function.
#' @examples
#' \dontrun{
#' #It is a private method. Look at runTest of RankedBasedTest's examples.
#' }
setMethod("runTest",
          signature(testObject = "KolmogorovSmirnovTest"),
          function(testObject) {
            testObject@test(testObject)
          })
