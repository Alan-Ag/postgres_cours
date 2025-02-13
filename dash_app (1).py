import dash
from dash import dcc, html
import plotly.express as px
import pandas as pd

# Sample DataFrame
df = pd.read_csv('gapminder_edited.csv')
#  ON ne garde que les valeurs de l'année 2007
df = df[df['year'] == 2007]

# Comment faire pour les pays d'affichent dans l'ordre de la population ?
df = df.sort_values('pop', ascending=False)

# Liste des continents uniques
continents = df['continent'].unique()


# Initialize Dash app
app = dash.Dash(__name__)



# Layout
app.layout = html.Div([
    html.H1("Histogram Example"),
    dcc.Graph(
        id="histogram",
        figure=px.histogram(df, x="country", y="pop", title="Population by countries")
    )
])

# Run app
if __name__ == "__main__":
    app.run_server(debug=True, port=8050)
    
