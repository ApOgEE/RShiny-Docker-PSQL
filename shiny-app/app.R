# Install packages yang diperlukan
library(shiny)
library(DBI)
library(dotenv)

load_dot_env(file = ".env")

options(shiny.host = '0.0.0.0')
options(shiny.port = 8083)

# PostgreSQL connection details
db_host <- Sys.getenv("DB_HOST")  # PostgreSQL host
db_port <- Sys.getenv("DB_PORT")  # PostgreSQL port
db_name <- Sys.getenv("DB_NAME")  # PostgreSQL database name
db_user <- Sys.getenv("DB_USER")  # PostgreSQL username
db_password <- Sys.getenv("DB_PASS")  # PostgreSQL password

# Establish a connection to the PostgreSQL database
con <- dbConnect(RPostgres::Postgres(),dbname = db_name, 
                 host = db_host, 
                 port = db_port, 
                 user = db_user,
                 password = db_password)

# UI
ui <- navbarPage("APOGEE R Shiny",
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "apostyle.css")
  ),

  tabPanel("User Table", 
        titlePanel("R-Shiny dengan PostgreSQL Connection"),
        tableOutput("table_data"),
        tags$div(class="mycontainer",
            tags$h3("Keterangan Data"),
            tags$p("Ini adalah contoh paragraf. Setelah ayat ini, ia hanyalah random wiki quote dan tidak lagi relevan."),
            tags$p(HTML("Terengganu merupakan negeri dalam alam Melayu pertama yang bertapaknya ajaran Islam sepertimana mengikut<br/> 
            Batu Bersurat Terengganu yang ditemui di Kuala Berang, Hulu Terengganu di mana tarikh ia dipahat diamati<br/>
            sekitar antara 702 dan 789 tahun Hijriah atau antara 1303 dan 1387 tahun Masihi."))
        )),
  tabPanel("Sample Page",
        titlePanel("Contoh Slider Input"),
        sliderInput(
            "Indikator", label = "Jumlah Indikator:",
            min = 1, value = 35, max = 99
      )),
  tabPanel("Page Ketiga",
        titlePanel("Page ini sengaja dibiarkan kosong"),
        tags$p("Walaupun ia sebenarnya tidaklah kosong. Kerana kekosongan itu telah dipenuhi dengan teks.")
  )
)

# Server
server <- function(input, output, session) {
  # Query database dan render table
  output$table_data <- renderTable({
    query <- "SELECT user_id id, nama, username, email, TO_CHAR(created_on,'YYYY/MM/DD HH:MI:SS') tarikh_daftar FROM tb_users"
    data <- dbGetQuery(con, query)
    data
  })
}

# Run the application
shinyApp(ui = ui, server = server)
