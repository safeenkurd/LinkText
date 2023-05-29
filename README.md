

## Getting Started

The LinkText package is a powerful Flutter utility designed to transform URLs embedded in text strings into tappable inline links, bringing in enhanced interactivity to your text content. Alongside this, it also offers a unique 'Read More/Less' feature for handling long texts.


## Features

* Auto-Detection and Link Creation: LinkText can automatically identify URLs within a string and convert them into clickable inline links. This works regardless of whether the link is at the beginning, middle, or end of the text, and can handle incorrectly formatted links as well.
* Customizable Styling: You can independently style the regular text and link text. This helps in visually distinguishing links from the rest of the text.
* bURL Launch: LinkText not only creates links but also handles the launching of these links when tapped. The links can be opened within the application or can launch an external application, depending on the provided LaunchMode.
* Integrated 'Read More/Less' Support: In conjunction with the ReadMoreText widget, LinkText can manage lengthy texts by collapsing them with an option to expand. Upon expanding, the complete text, along with embedded links, becomes visible. This feature allows for cleaner UI and improved readability, especially for long-form content.

## Usage

LinkText(
  text: "Check out https://www.void.krd for more information.",
  style: TextStyle(color: Colors.black),
  linkStyle: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
  mode: LaunchMode.inAppWebView,
)


