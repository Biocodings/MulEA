% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SetBasedTest.R
\docType{class}
\name{SetBasedTest-class}
\alias{SetBasedTest-class}
\alias{SetBasedTest}
\alias{runTest,SetBasedTest-method}
\title{An S4 class to represent a set based tests in Mulea.}
\usage{
\S4method{runTest}{SetBasedTest}(testObject)
}
\arguments{
\item{testObject}{Object of s4 class represents Mulea Test.}
}
\value{
SetBasedTest object. This object represents set based tests in Mulea.

runTest method for SetBasedTest object. Returns results of counting using methods from set based area.
}
\description{
An S4 class to represent a set based tests in Mulea.
}
\section{Methods (by generic)}{
\itemize{
\item \code{runTest}: runs test calculations.
}}

\section{Slots}{

\describe{
\item{\code{gmt}}{A data.frame representing GMT's reprezentation of model.}

\item{\code{testData}}{A data from expeciment to analize accross model.}

\item{\code{pool}}{A background data to count test.}

\item{\code{adjustMethod}}{A type of algorithm used to adjust values.}
}}

\examples{
modelDfFromFile <- MulEA::readGmtFileAsDataFrame(gmtFilePath = system.file(package="MulEA", "extdata", "model.gmt"))
dataFromExperiment <- c("FBgn0004407", "FBgn0010438", "FBgn0003742", "FBgn0029709", "FBgn0030341", "FBgn0037044", "FBgn0002887", "FBgn0028434", "FBgn0030170", "FBgn0263831")
dataFromExperimentPool <- unique(c(c("FBgn0033690", "FBgn0261618", "FBgn0004407", "FBgn0010438", "FBgn0032154", "FBgn0039930", "FBgn0040268", "FBgn0013674", "FBgn0037008", "FBgn0003116", "FBgn0037743", "FBgn0035401", "FBgn0037044", "FBgn0051005", "FBgn0026737", "FBgn0026751", "FBgn0038704", "FBgn0002887", "FBgn0028434", "FBgn0030170", "FBgn0263831", "FBgn0000579"), c("FBgn0066666", "FBgn0000000", "FBgn0099999", "FBgn0011111", "FBgn0022222", "FBgn0777777", "FBgn0333333", "FBgn0003742", "FBgn0029709", "FBgn0030341")))
setBasedTest <- SetBasedTest(gmt = modelDfFromFile, testData = dataFromExperiment)
setBasedTestWithPool <- SetBasedTest(gmt = modelDfFromFile, testData = dataFromExperiment, pool = dataFromExperimentPool)
setBasedTestWithPoolAndAdjust <- SetBasedTest(gmt = modelDfFromFile, testData = dataFromExperiment, pool = dataFromExperimentPool, adjustMethod = "BH")
modelDfFromFile <- MulEA::readGmtFileAsDataFrame(gmtFilePath = system.file(package="MulEA", "extdata", "model.gmt"))
dataFromExperiment <- c("FBgn0004407", "FBgn0010438", "FBgn0003742", "FBgn0029709", "FBgn0030341", "FBgn0037044", "FBgn0002887", "FBgn0028434", "FBgn0030170", "FBgn0263831")
dataFromExperimentPool <- unique(c(c("FBgn0033690", "FBgn0261618", "FBgn0004407", "FBgn0010438", "FBgn0032154", "FBgn0039930", "FBgn0040268", "FBgn0013674", "FBgn0037008", "FBgn0003116", "FBgn0037743", "FBgn0035401", "FBgn0037044", "FBgn0051005", "FBgn0026737", "FBgn0026751", "FBgn0038704", "FBgn0002887", "FBgn0028434", "FBgn0030170", "FBgn0263831", "FBgn0000579"), c("FBgn0066666", "FBgn0000000", "FBgn0099999", "FBgn0011111", "FBgn0022222", "FBgn0777777", "FBgn0333333", "FBgn0003742", "FBgn0029709", "FBgn0030341")))
setBasedTest <- SetBasedTest(gmt = modelDfFromFile, testData = dataFromExperiment)
setBasedTestWithPool <- SetBasedTest(gmt = modelDfFromFile, testData = dataFromExperiment, pool = dataFromExperimentPool)
setBasedTestWithPoolAndAdjust <- SetBasedTest(gmt = modelDfFromFile, testData = dataFromExperiment, pool = dataFromExperimentPool, adjustMethod = "BH")
setBasedTestRes <- MulEA::runTest(setBasedTest)
setBasedTestWithPoolRes <- MulEA::runTest(setBasedTestWithPool)
setBasedTestWithPoolAndAdjustRes <- MulEA::runTest(setBasedTestWithPoolAndAdjust)
}
