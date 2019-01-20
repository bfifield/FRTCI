#' @export
print.summary.FRTCI.test <- function(x, ...){
    
    cat("\n")
    cat("Call:\n")
    print(x$call)
    cat("\n")
    cat("Test Statistic:", x$test.stat, "\n")
    cat("\n")
    cat("Estimates:\n")
    print(x$estimates)
    
}

#' @export
print.FRTCI.test <- function( x, ... ) {
    print(summary(x)$estimates)
}

#' @export
print.RI.regression.result <- function(x, digits = max(3L, getOption("digits") - 3L), ...){
    out <- summary(x)
    if("coefficients" %in% names(out)) {
        cat("\nCoefficients:\n")
        print.default(format( out$coefficients, digits = digits), print.gap = 2L,
                      quote = FALSE)
    }
    else cat("No coefficients\n")
    cat("\nVariance-Covariance Matrix:\n")
    print( out$vcov )
    scat(  "\nChi-squared test for systematic variation: X^2=%.2f; p=%.3f\n",
         out$chisq.stat, out$p.value )
    invisible(x)
}

#' @export
print.summary.RI.regression.result <- function(x, digits = max(3L, getOption("digits") - 3L), ...){

    cat("\nSystematic Estimation Regression of Heterogeneous Treatment Effects:", x$method, "\n\n")
    cat("Call:\n")
    print(x$call)

    if("coefficients" %in% names(x)) {
        cat("\nCoefficients:\n")
        print.default(format( x$coefficients, digits = digits), print.gap = 2L,
                      quote = FALSE)
    }
    else cat("No coefficients\n")
    cat("\nVariance-Covariance Matrix:\n")
    print( x$vcov )
    scat(  "\nChi-squared test for systematic variation: X^2=%.2f; p=%.3f\n", x$chisq.stat, x$p.value )

    scat( "\nDetails: ATE = %.3f +/- %.3f     SD(Y(0)) = %.3f   SD(Y(1)) = %.3f", x$ATE, 1.96 * x$SE.ATE, x$SD.Y0, x$SD.Y1 )
    scat("\n")

    invisible( x )

}

#' @export
print.RI.R2.result <- function( x, ... ) {
    print(summary(x))
    invisible(x)
}

#' @export
print.summary.RI.R2.result <- function(x, digits = max(3L, getOption("digits") - 3L), ...){

    cat("\n", paste0("R2 for Systematic Estimation Regression of Heterogeneous Treatment Effects (", x$method, ")"), "\n")
    if(x$method == "LATE"){
        cat("\nR2 Estimates:\n")
        print(round(x$hte_r2, digits = digits))
        cat("\nVariance Estimates:\n")
        cat("\tSystematic Treatment Effect Variation for Compliers:",
            round(x$hte_variance_systematic_compliers, digits), "\n")
        cat("\tSystematic Treatment Effect Variation for Strata:",
            round(x$hte_variance_systematic_strata, digits), "\n")
        cat("\tTotal Systematic Treatment Effect Variation:",
            round(x$hte_variance_systematic_total, digits), "\n")
        cat("\tIdiosyncratic Treatment Effect Variation for Compliers:",
            paste0(round(x$hte_variance_idiosyncratic[1], digits), " -- ",
                   round(x$hte_variance_idiosyncratic[3], digits),
                   " (", round(x$hte_variance_idiosyncratic[2], digits),
                   " Sharp)"), "\n")
        cat("\tTotal Treatment Effect Variation:",
            paste0(round(x$hte_variance_total[1], digits), " -- ",
            round(x$hte_variance_total[3], digits),
            " (", round(x$hte_variance_total[2], digits), " Sharp)"), "\n")

        scat( "\nDetails: LATE = %.3f; ITT = %.3f; Proportion compliers = %.3f\n", x$LATE, x$ITT, x$prop_compliers)

    }else{
        cat("\nR2 Estimates:\n")
        print(round(x$hte_r2, digits = digits))
        cat("\nVariance Estimates:\n")
        cat("\tSystematic Treatment Effect Variation:",
            round(x$hte_variance_systematic, digits), "\n")
        cat("\tIdiosyncratic Treatment Effect Variation:",
            paste0(round(x$hte_variance_idiosyncratic[1], digits), " -- ",
                   round(x$hte_variance_idiosyncratic[3], digits),
                   " (", round(x$hte_variance_idiosyncratic[2], digits),
                   " Sharp)"), "\n")
        cat("\tTotal Treatment Effect Variation:",
            paste0(round(x$hte_variance_total[1], digits), " -- ",
            round(x$hte_variance_total[3], digits),
            " (", round(x$hte_variance_total[2], digits), " Sharp)"), "\n")
    }
    invisible(x)
}
