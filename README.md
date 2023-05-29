

## Getting Started

The LinkText package is a powerful Flutter utility designed to transform URLs embedded in text strings into tappable inline links, bringing in enhanced interactivity to your text content. Alongside this, it also offers a unique 'Read More/Less' feature for handling long texts.


## Features

* Auto-Detection and Link Creation: LinkText can automatically identify URLs within a string and convert them into clickable inline links. This works regardless of whether the link is at the beginning, middle, or end of the text, and can handle incorrectly formatted links as well.
* Customizable Styling: You can independently style the regular text and link text. This helps in visually distinguishing links from the rest of the text.
* URL Launch: LinkText not only creates links but also handles the launching of these links when tapped. The links can be opened within the application or can launch an external application, depending on the provided LaunchMode.
* Integrated 'Read More/Less' Support: In conjunction with the ReadMoreText widget, LinkText can manage lengthy texts by collapsing them with an option to expand. Upon expanding, the complete text, along with embedded links, becomes visible. This feature allows for cleaner UI and improved readability, especially for long-form content.

## Usage

<table>
<tbody><tr>
<td>
<div class="-pub-pre-copy-container"><pre><code class="language-dart hljs"><span class="hljs-class"><span class="hljs-keyword"></span>

<span class="hljs-title">LinkText</span>(  
          text: <span class="hljs-string">"Check out https://www.void.krd for more information."</span>,  
<span class="hljs-keyword">   </span>     style: TextStyle(color: Colors.black),
<span class="hljs-keyword">   </span>           linkStyle: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
<span class="hljs-keyword">   </span>           mode: LaunchMode.inAppWebView,
        )  


</code></pre><div class="-pub-pre-copy-button" title="copy to clipboard"></div><div class="-pub-pre-copy-feedback">copied to clipboard</div></div>
</td>
</tr>
</tbody></table>

## Screenshots

<img width="300" height="500" src="https://archive.org/download/simulator-screenshot-i-phone-14-pro-2023-05-30-at-00.31.37/Simulator%20Screenshot%20-%20iPhone%2014%20Pro%20-%202023-05-30%20at%2000.31.37.png" alt="">


| Parameter        | Description |
| ---------------- | ----------- |
| text             | The main text to display (required). |
| style            | The TextStyle for the non-link parts of the text. |
| linkStyle        | The TextStyle for hyperlinks in the text. |
| lengthThreshold  | The maximum length of collapsed text. |
| readMoreText     | The string to display for the 'Read More' link. |
| readLessText     | The string to display for the 'Read Less' link. |
| readMoreColor    | The color of the 'Read More' text. |
| readLessColor    | The color of the 'Read Less' text. |
| mode             | The mode used to launch URLs. |




[Check out the example application here](https://github.com/safeenkurd/LinkText/tree/main/text_link/example)
