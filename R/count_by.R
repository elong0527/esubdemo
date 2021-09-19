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
  data <- data %>% rename(grp = !!grp, var = !!var, id = !!id)
  
  left_join(
    count(data, grp, var),
    count(data, grp, name = "tot"),
    by = "grp",
  ) %>%
    mutate(
      pct = fmt_num(100 * n / tot, digits = 1),
      n = fmt_num(n, digits = 0),
      npct = paste0(n, " (", pct, ")")
    ) %>%
    pivot_wider(
      id_cols = var,
      names_from = grp,
      values_from = c(n, pct, npct),
      values_fill = list(n = "0", pct = fmt_num(0, digits = 0))
    ) %>%
    mutate(var_label = var_label)
}