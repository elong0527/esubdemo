#' Count value by variables
#'
#' @param data A data frame
#' @param grp Group variable in `data`.
#' @param var Analysis variable in `data`.
#' @param var_label A string of analysis variable label.
#' @param id Subject id variable in `data`.
#'
#' @export
count_by <- function(data,
                     grp,
                     var,
                     var_label = var,
                     id = "USUBJID") {
  data <- data %>%
    dplyr::rename(grp = !!grp, var = !!var, id = !!id)

  dplyr::left_join(
    dplyr::count(data, grp, var),
    dplyr::count(data, grp, name = "tot"),
    by = "grp",
  ) %>%
    dplyr::mutate(
      pct = fmt_num(100 * n / tot, digits = 1),
      n = fmt_num(n, digits = 0),
      npct = paste0(n, " (", pct, ")")
    ) %>%
    tidyr::pivot_wider(
      id_cols = var,
      names_from = grp,
      values_from = c(n, pct, npct),
      values_fill = list(n = "0", pct = fmt_num(0, digits = 0))
    ) %>%
    dplyr::mutate(var_label = var_label)
}
