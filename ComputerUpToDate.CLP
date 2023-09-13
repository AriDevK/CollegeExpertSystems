;================================================================
; Author: Ariadne Rangel
; File: ComputerUpToDate.CLP
; Description: Check if a computer components are up to date
; ===============================================================

(
    defrule step0
    (not(start))
    =>
    (assert(computerHas6Cores))
    (assert(computerHas16Ram))
    (assert(computerHasSoUpdated))
)

(
    defrule step1
    (computerHas16Ram)
    =>
    (assert(hasRamUpdated))
    (printout t "Your RAM is Up to date" crlf)
)

(
    defrule step2
    (hasRamUpdated)
    (computerHas6Cores)
    =>
    (assert(hasProcessorUpdated))
    (printout t "Your processor is Up to date" crlf)
)

(
    defrule step3
    (hasRamUpdated)
    (hasProcessorUpdated)
    (computerHasSoUpdated)
    =>
    (assert(ComputadoraActualizada))
    (printout t "Your O.S is Up to date" crlf)
)
