// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PageQuery: GraphQLQuery {
  public static let operationName: String = "Page"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Page($page: Int, $perPage: Int, $searchTerm: String) { Page(page: $page, perPage: $perPage) { __typename pageInfo { __typename currentPage perPage lastPage total hasNextPage } media(search: $searchTerm) { __typename id title { __typename romaji english native userPreferred } type format episodes description countryOfOrigin startDate { __typename day month year } endDate { __typename day month year } } } }"#
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var searchTerm: GraphQLNullable<String>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    searchTerm: GraphQLNullable<String>
  ) {
    self.page = page
    self.perPage = perPage
    self.searchTerm = searchTerm
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "searchTerm": searchTerm
  ] }

  public struct Data: AnilistAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AnilistAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": .variable("page"),
        "perPage": .variable("perPage")
      ]),
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: AnilistAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AnilistAPI.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("pageInfo", PageInfo?.self),
        .field("media", [Medium?]?.self, arguments: ["search": .variable("searchTerm")]),
      ] }

      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }
      public var media: [Medium?]? { __data["media"] }

      /// Page.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: AnilistAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AnilistAPI.Objects.PageInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("currentPage", Int?.self),
          .field("perPage", Int?.self),
          .field("lastPage", Int?.self),
          .field("total", Int?.self),
          .field("hasNextPage", Bool?.self),
        ] }

        /// The current page
        public var currentPage: Int? { __data["currentPage"] }
        /// The count on a page
        public var perPage: Int? { __data["perPage"] }
        /// The last page
        public var lastPage: Int? { __data["lastPage"] }
        /// The total number of items. Note: This value is not guaranteed to be accurate, do not rely on this for logic
        public var total: Int? { __data["total"] }
        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
      }

      /// Page.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: AnilistAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AnilistAPI.Objects.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("title", Title?.self),
          .field("type", GraphQLEnum<AnilistAPI.MediaType>?.self),
          .field("format", GraphQLEnum<AnilistAPI.MediaFormat>?.self),
          .field("episodes", Int?.self),
          .field("description", String?.self),
          .field("countryOfOrigin", AnilistAPI.CountryCode?.self),
          .field("startDate", StartDate?.self),
          .field("endDate", EndDate?.self),
        ] }

        /// The id of the media
        public var id: Int { __data["id"] }
        /// The official titles of the media in various languages
        public var title: Title? { __data["title"] }
        /// The type of the media; anime or manga
        public var type: GraphQLEnum<AnilistAPI.MediaType>? { __data["type"] }
        /// The format the media was released in
        public var format: GraphQLEnum<AnilistAPI.MediaFormat>? { __data["format"] }
        /// The amount of episodes the anime has when complete
        public var episodes: Int? { __data["episodes"] }
        /// Short description of the media's story and characters
        public var description: String? { __data["description"] }
        /// Where the media was created. (ISO 3166-1 alpha-2)
        public var countryOfOrigin: AnilistAPI.CountryCode? { __data["countryOfOrigin"] }
        /// The first official release date of the media
        public var startDate: StartDate? { __data["startDate"] }
        /// The last official release date of the media
        public var endDate: EndDate? { __data["endDate"] }

        /// Page.Medium.Title
        ///
        /// Parent Type: `MediaTitle`
        public struct Title: AnilistAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AnilistAPI.Objects.MediaTitle }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("romaji", String?.self),
            .field("english", String?.self),
            .field("native", String?.self),
            .field("userPreferred", String?.self),
          ] }

          /// The romanization of the native language title
          public var romaji: String? { __data["romaji"] }
          /// The official english title
          public var english: String? { __data["english"] }
          /// Official title in it's native language
          public var native: String? { __data["native"] }
          /// The currently authenticated users preferred title language. Default romaji for non-authenticated
          public var userPreferred: String? { __data["userPreferred"] }
        }

        /// Page.Medium.StartDate
        ///
        /// Parent Type: `FuzzyDate`
        public struct StartDate: AnilistAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AnilistAPI.Objects.FuzzyDate }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("day", Int?.self),
            .field("month", Int?.self),
            .field("year", Int?.self),
          ] }

          /// Numeric Day (24)
          public var day: Int? { __data["day"] }
          /// Numeric Month (3)
          public var month: Int? { __data["month"] }
          /// Numeric Year (2017)
          public var year: Int? { __data["year"] }
        }

        /// Page.Medium.EndDate
        ///
        /// Parent Type: `FuzzyDate`
        public struct EndDate: AnilistAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AnilistAPI.Objects.FuzzyDate }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("day", Int?.self),
            .field("month", Int?.self),
            .field("year", Int?.self),
          ] }

          /// Numeric Day (24)
          public var day: Int? { __data["day"] }
          /// Numeric Month (3)
          public var month: Int? { __data["month"] }
          /// Numeric Year (2017)
          public var year: Int? { __data["year"] }
        }
      }
    }
  }
}
