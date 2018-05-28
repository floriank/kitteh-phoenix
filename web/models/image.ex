defmodule Kitteh.Image do
  use Kitteh.Web, :model

  schema "images" do
    field :original_name, :string
    field :token, :string
    field :generated_name, :string

    # the type, will be "Kitty" for now, could be "Doge" later
    field :type, :string, default: "Kitty"

    # the original content_type
    field :content_type, :string

    # the new path where our image is copied to
    field :path, :string

    # size information
    field :size, :integer

    # virtual field to allow form building
    field :file, :string, virtual: true

    timestamps
  end

  @required_fields ~w(original_name content_type generated_name token path)
  @optional_fields ~w(size)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  # word list used for generating, 68 * 91 * 58 = 358904 combinations possible
  # list of adjectives as synomyns for "cute"
  @adjective ~w(Cute Perky Attractive Beautiful Charming Pleasant Delightful Adorable Dainty Happy Alluring Fascinating Magnificent Marvelous Graceful Fine Dazzling Superb Wonderful Delightful Pretty Grand Lovely Gorgeous Stunning Goodlooking Delicate Handsome Pleasing Splendid Elegant Appealing Exquisite Admirable Angelic Classy Comely Divine Excellent Fair Foxy Ideal Nice Radiant Ravishing Refined Resplendent Shapely Statuesque Sublime Symmetrical Beauteous Bewitching Enticing Pulchritudinous Sightly Taking Wellformed)
  # a list of colours - see https://en.wikibooks.org/wiki/LaTeX/Colors
  @colour ~w(Apricot Aquamarine Bittersweet Black Blue BlueGreen BlueViolet BrickRed  Brown BurntOrange CadetBlue CarnationPink Cerulean CornflowerBlue Cyan Dandelion DarkOrchid Emerald ForestGreen Fuchsia Goldenrod Gray Green GreenYellow JungleGreen Lavender LimeGreen Magenta  Mahogany Maroon Melon MidnightBlue Mulberry NavyBlue OliveGreen Orange OrangeRed Orchid Peach Periwinkle PineGreen Plum ProcessBlue Purple RawSienna Red RedOrange RedViolet Rhodamine RoyalBlue RoyalPurple RubineRed Salmon SeaGreen Sepia SkyBlue SpringGreen Tan TealBlue Thistle Turquoise Violet VioletRed White WildStrawberry Yellow YellowGreen YellowOrange)
  # breeds scraped from https://www.wikiwand.com/en/List_of_cat_breeds
  @breed ~w(Abyssinian Aegean AmericanCurl AmericanBobtail AmericanShorthair AmericanWirehair ArabianMau AustralianMist Asian  Balinese Bambino Bengal Birman Bombay BrazilianShorthair BritishShorthair BritishLonghair Burmese Burmilla CaliforniaSpangled ChantillyTiffany Chartreux Chausie Cheetoh Colorpoint Shorthair Cornish Rex Cymric Cyprus DevonRex Donskoy DragonLi Dwarfcat EgyptianMau EuropeanShorthair ExoticShorthair FoldexCat GermanRex HavanaBrown Highlander Himalayan JapaneseBobtail Javanese KurilianBobtail Khao Manee Korat KurilianBobtail LaPerm Lykoi MaineCoon Manx Minskin Munchkin Nebelung Napoleon NorwegianForest Ocicat OjosAzules OregonRex OrientalBicolor OrientalShorthair OrientalLonghair Persian GreaterIran Peterbald PixieBob Raas Ragamuffin Ragdoll RussianBlue RussianWhiteBlackAndTabby Savannah ScottishFold SelkirkRex Serengeti Siamese Siberian Singapura Snowshoe Sokoke Somali Sphynx Suphalak Thai Tonkinese Toyger TurkishAngora TurkishVan UkrainianLevkoy)

  @doc """
  Generates a token from the word list in the fashion adjective + colour + breed, e.g.

  Kitteh.Image.token
  # => "SublimeDandelionUkrainianLevkoy"
  """
  def generate_unique_name do
    [
      Enum.random(@adjective),
      Enum.random(@colour),
      Enum.random(@breed)
    ]
    |> Enum.join
  end
  
  def generate_another_image do
    "foobar"
  end
end
