#' fetch_data: Query MySQL database for a specific transaction (deal).
#'
#' @ param deal A single quoted string
#' @ param var_names A single quoted comma delimited string of fields
#' returns a tibble of all (or the selected) rows in the default table
#' @examples
#' case1 <- fetch_data("'LBMLT 2006-1'")
#' var_names = ('fico, dti')
#' case1 <- fetch_data('LBMLT 2006-1', var_names)
#' deal = "'LBMLT 2006-1'"
#' case1 <- fetch_data(deal = deal, var_names = ('fico,dti'))
fetch_data <- function(deal, var_names = "*", driver = "MySQL", username = "root", password = "",
                       dbname = "dlf", host = "localhost", table = "loans")
{
    drv <- dbDriver(driver)
    con <- dbConnect(drv, username = username, password = password, dbname = dbname, host = host)
    res <- dbGetQuery(con, paste('SELECT', var_names, 'FROM', table, 'WHERE', 'deal', '=', deal))
    return(as.tibble(res))
}



