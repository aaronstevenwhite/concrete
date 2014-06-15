namespace java edu.jhu.hlt.concrete
namespace py concrete.nitf

struct NITFInfo {
  /**
   * This field specifies the location on nytimes.com of the article. When
   * present, this URL is preferred to the URL field on articles published on
   * or after April 02, 2006, as the linked page will have richer content.
   */
  1: optional string alternateURL

  /**
   * This field is a summary of the article written by the New York Times
   * Indexing Service.
   */
  2: optional string articleAbstract

  /**
   * This field specifies the biography of the author of the article.
   * Generally, this field is specified for guest authors not for New York
   * Times reporters. When this field is specified for Times reporters, it is
   * usually used to provide the author's email address.
   */
  3: optional string authorBiography;

  /**
   * The banner field is used to indicate if there has been additional
   * information appended to the articles since its publication. Examples of
   * banners include ('Correction Appended' and 'Editor's Note Appended').
   */
  4: optional string banner

  /**
   * When present, the biographical category field generally indicates that a
   * document focuses on a particular individual. The value of the field
   * indicates the area or category in which this individual is best known.
   * This field is most often defined for Obituaries and Book Reviews. These
   * tags are hand-assigned by a team of library scientists working for the
   * New York Times Indexing service.
   * 
   * <ol>
   * <li>Politics and Government (U.S.) <li>Books and Magazines <li>Royalty
   * </ol>
   */
  5: optional list<string> biographicalCategories

  /**
   * The body field is the text content of the article. Please note that this
   * value includes the lead paragraph.
   */
  6: optional string body

  /**
   * This field specifies the byline of the article as it appeared in the
   * print edition of the New York Times. Please note that not every article
   * in this collection has a byline, as editorials and other types of
   * articles are generally unsigned.
   * <P>
   * Sample byline:
   * <ul>
   * <li>By James Reston
   * <li>By JAMES GLANZ; William J. Broad contributed reporting for this
   * article.
   * <li>By ADAM NAGOURNEY and JEFF ZELENY
   * </ul>
   */
  7: optional string byline

  /**
   * If the article is part of a regular column, this field specifies the name
   * of that column.
   * <p>
   * Sample Column Names:
   * <p>
   * <ol>
   * <li>World News Briefs
   * <li>WEDDINGS
   * <li>The Accessories Channel
   * </ol>
   * 
   */
  8: optional string columnName

  /**
   * This field specifies the column in which the article starts in the print
   * paper. A typical printed page in the paper has six columns numbered from
   * right to left. As a consequence most, but not all, of the values for this
   * field fall in the range 1-6.
   */
  9: optional i32 columnNumber

  /**
   * This field specifies the date on which a correction was made to the
   * article. Generally, if the correction date is specified, the correction
   * text will also be specified (and vice versa).
   */
  10: optional i64 correctionDate

  /**
   * For articles corrected following publication, this field specifies the
   * correction. Generally, if the correction text is specified, the
   * correction date will also be specified (and vice versa).
   */
  11: optional string correctionText

  /**
   * This field indicates the entity that produced the editorial content of
   * this document. For this collection, the credit will always be set to 'The
   * New York Times'.
   */
  12: optional string credit

  /**
   * The �dateline� field is the dateline of the article. Generally a dateline
   * is the name of the geographic location from which the article was filed
   * followed by a comma and the month and day of the filing.
   * <p>
   * Sample datelines:
   * <ul>
   * <li>WASHINGTON, April 30
   * <li>RIYADH, Saudi Arabia, March 29
   * <li>ONTARIO, N.Y., Jan. 26
   * </ul>
   * Please note:
   * <ol>
   * <li>The dateline location is the location from which the article was
   * filed. Often times this location is related to the content of the
   * article, but this is not guaranteed.
   * <li>The date specified for the dateline is often but not always the day
   * previous to the publication date.
   * <li>The date is usually but not always specified.
   * </ol>
   */
  13: optional string dateline

  /**
   * This field specifies the day of week on which the article was published.
   * <ul>
   * <li>Monday <li>Tuesday <li>Wednesday <li>Thursday <li>Friday <li>Saturday
   * <li>Sunday
   * </ul>
   */
  14: optional string dayOfWeek

  /**
   * The �descriptors� field specifies a list of descriptive terms drawn from
   * a normalized controlled vocabulary corresponding to subjects mentioned in
   * the article. These tags are hand-assigned by a team of library scientists
   * working in the New York Times Indexing service.
   * <p>
   * Examples Include:
   * <ol>
   * <li>ECONOMIC CONDITIONS AND TRENDS
   * <li>AIRPLANES
   * <li>VIOLINS
   * </ol>
   */
  15: optional list<string> descriptors

  /**
   * The
   */
  16: optional string featurePage

  /**
   * The �general online descriptors� field specifies a list of descriptors
   * that are at a higher level of generality than the other tags associated
   * with the article. These tags are algorithmically assigned and manually
   * verified by nytimes.com production staff.
   * <p>
   * Examples Include:
   * <ol>
   * <li>Surfing
   * <li>Venice Biennale
   * <li>Ranches
   * </ol>
   */
  17: list<string> generalOnlineDescriptors

  /**
   * The GUID field specifies a an integer that is guaranteed to be unique for
   * every document in the corpus.
   */
  18: optional i32 guid

  /**
   * This field specifies the headline of the article as it appeared in the
   * print edition of the New York Times.
   */
  19: optional string headline

  /**
   * The kicker is an additional piece of information printed as an
   * accompaniment to a news headline.
   */
  20: optional string kicker

  /**
   * The �lead Paragraph� field is the lead paragraph of the article.
   * Generally this field is populated with the first two paragraphs from the
   * article.
   */
  21: optional string leadParagraph

  /**
   * The �locations� field specifies a list of geographic descriptors drawn
   * from a normalized controlled vocabulary that correspond to places
   * mentioned in the article. These tags are hand-assigned by a team of
   * library scientists working for the New York Times Indexing service.
   * <p>
   * Examples Include:
   * <ol>
   * <li>Wellsboro (Pa)
   * <li>Kansas City (Kan)
   * <li>Park Slope (NYC)
   * </ol>
   */
  22: optional list<string> locations

  /**
   * The �names� field specifies a list of names mentioned in the article.
   * These tags are hand-assigned by a team of library scientists working for
   * the New York Times Indexing service.
   * <p>
   * Examples Include:
   * <ol>
   * <li>Azza Fahmy
   * <li>George C. Izenour
   * <li>Chris Schenkel
   * </ol>
   */
  23: optional list<string> names

  /**
   * This field specifies the desk in the New York Times newsroom that
   * produced the article. The desk is related to, but is not the same as the
   * section in which the article appears.
   */
  24: optional string newsDesk

  /**
   * The Normalized Byline field is the byline normalized to the form (last
   * name, first name).
   */
  25: optional string normalizedByline

  /**
   * This field specifies a list of descriptors from a normalized controlled
   * vocabulary that correspond to topics mentioned in the article. These tags
   * are algorithmically assigned and manually verified by nytimes.com
   * production staff.
   * <p>
   * Examples Include:
   * <ol>
   * <li>Marriages
   * <li>Parks and Other Recreation Areas
   * <li>Cooking and Cookbooks
   * </ol>
   */
  26: optional list<string> onlineDescriptors

  /**
   * This field specifies the headline displayed with the article on
   * nytimes.com. Often this differs from the headline used in print.
   */
  27: optional string onlineHeadline

  /**
   * This field specifies the lead paragraph as defined by the producers at
   * nytimes.com.
   */
  28: optional string onlineLeadParagraph

  /**
   * This field specifies a list of place names that correspond to geographic
   * locations mentioned in the article. These tags are algorithmically
   * assigned and manually verified by nytimes.com production staff.
   * <p>
   * Examples Include:
   * <ol>
   * <li>Hollywood
   * <li>Los Angeles
   * <li>Arcadia
   * </ol>
   */
  29: optional list<string> onlineLocations

  /**
   * This field specifies a list of organizations that correspond to
   * organizations mentioned in the article. These tags are algorithmically
   * assigned and manually verified by nytimes.com production staff.
   * <p>
   * Examples Include:
   * <ol>
   * <li>Nintendo Company Limited
   * <li>Yeshiva University
   * <li>Rose Center
   * </ol>
   */
  30: optional list<string> onlineOrganizations

  /**
   * This field specifies a list of people that correspond to individuals
   * mentioned in the article. These tags are algorithmically assigned and
   * manually verified by nytimes.com production staff.
   * <p>
   * Examples Include:
   * <ol>
   * <li>Lopez, Jennifer
   * <li>Joyce, James
   * <li>Robinson, Jackie
   * </ol>
   */
  31: optional list<string> onlinePeople

  /**
   * This field specifies the section(s) on nytimes.com in which the article
   * is placed. If the article is placed in multiple sections, this field will
   * be specified as a �;� delineated list.
   */
  32: optional string onlineSection

  /**
   * This field specifies a list of authored works mentioned in the article.
   * These tags are algorithmically assigned and manually verified by
   * nytimes.com production staff.
   * <p>
   * Examples Include:
   * <ol>
   * <li>Matchstick Men (Movie)
   * <li>Blades of Glory (Movie)
   * <li>Bridge & Tunnel (Play)
   * </ol>
   */
  33: optional list<string> onlineTitles

  /**
   * This field specifies a list of organization names drawn from a normalized
   * controlled vocabulary that correspond to organizations mentioned in the
   * article. These tags are hand-assigned by a team of library scientists
   * working in the New York Times Indexing service.
   * <p>
   * Examples Include:
   * <ol>
   * <li>Circuit City Stores Inc
   * <li>Delaware County Community College (Pa)
   * <li>CONNECTICUT GRAND OPERA
   * </ol>
   */
  34: optional list<string> organizations

  /**
   * This field specifies the page of the section in the paper in which the
   * article appears. This is not an absolute pagination. An article that
   * appears on page 3 in section A occurs in the physical paper before an
   * article that occurs on page 1 of section F.
   */
  35: optional i32 page

  /**
   * This field specifies a list of people from a normalized controlled
   * vocabulary that correspond to individuals mentioned in the article. These
   * tags are hand-assigned by a team of library scientists working in the New
   * York Times Indexing service.
   * <p>
   * Examples Include:
   * <ol>
   * <li>REAGAN, RONALD WILSON (PRES)
   * <li>BEGIN, MENACHEM (PRIME MIN)
   * <li>COLLINS, GLENN
   * </ol>
   */
  36: optional list<string> people

  /**
   * This field specifies the date of the article�s publication.
   */
  37: optional i64 publicationDate

  /**
   * This field specifies the day of the month on which the article was
   * published, always in the range 1-31.
   */
  38: optional i32 publicationDayOfMonth

  /**
   * This field specifies the month on which the article was published in the
   * range 1-12 where 1 is January 2 is February etc.
   */
  39: optional i32 publicationMonth

  /**
   * This field specifies the year in which the article was published. This
   * value is in the range 1987-2007 for this collection.
   */
  40: optional i32 publicationYear

  /**
   * This field specifies the section of the paper in which the article
   * appears. This is not the name of the section, but rather a letter or
   * number that indicates the section.
   */
  41: optional string section

  /**
   * If the article is part of a regular series, this field specifies the name
   * of that column.
   */
  42: optional string seriesName

  /**
   * The slug is a short string that uniquely identifies an article from all
   * other articles published on the same day. Please note, however, that
   * different articles on different days may have the same slug.
   * <ul>
   * <li>30other <li>12reunion
   * </ul>
   */
  43: optional string slug

  /** 
   * The file from which this object was read. 
   */
  44: optional string sourceFilePath;

  /**
   * This field specifies a list of taxonomic classifiers that place this
   * article into a hierarchy of articles. The individual terms of each
   * taxonomic classifier are separated with the '/' character. These tags are
   * algorithmically assigned and manually verified by nytimes.com production
   * staff. These tags are algorithmically assigned and manually verified by
   * nytimes.com production staff.
   * <p>
   * Examples Include:
   * <ol>
   * <li>Top/Features/Travel/Guides/Destinations/North America/United
   * States/Arizona
   * <li>Top/News/U.S./Rockies
   * <li>Top/Opinion
   * </ol>
   */
  45: optional list<string> taxonomicClassifiers

  /**
   * This field specifies a list of authored works that correspond to works
   * mentioned in the article. These tags are hand-assigned by a team of
   * library scientists working in the New York Times Indexing service.
   * <p>
   * Examples Include:
   * <ol>
   * <li>Greystoke: The Legend of Tarzan, Lord of the Apes (Movie)
   * <li>Law & Order (TV Program)
   * <li>BATTLEFIELD EARTH (BOOK)
   * </ol>
   */
  46: optional list<string> titles

  /**
   * This field specifies a normalized list of terms describing the general
   * editorial category of the article. These tags are algorithmically
   * assigned and manually verified by nytimes.com production staff.
   * <p>
   * Examples Include:
   * <ol>
   * <li>REVIEW
   * <li>OBITUARY
   * <li>ANALYSIS
   * </ol>
   */
  47: optional list<string> typesOfMaterial

  /**
   * This field specifies the location on nytimes.com of the article. The
   * �Alternative Url� field is preferred to this field on articles published
   * on or after April 02, 2006, as the linked page will have richer content.
   */
  48: optional string url

  /**
   * This field specifies the number of words in the body of the article,
   * including the lead paragraph.
   */
  49: optional i32 wordCount
 }
