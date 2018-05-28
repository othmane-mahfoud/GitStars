# GitStars :sparkles:

## Description

GitStars is a small app that will list the most starred Github repos that were created in the last 30 days using data fetched from the GitHub API.

## Technology and Tools Used

To develop this app I have used <strong>Swift 4</strong>, the new de facto programming language for iOS. That is in addition to the many libraries it provides with core functionalities such as the date etc. </br>
Along with Swift, I have used <strong>CocoaPods</strong> which provides "pods" such as <strong>Alamofire</strong> for networking and communicating with the API, <strong>SwiftyJSON</strong> to parse the JSON response and <strong>SVProgressHUD</strong> to enhance the user experience while data is loading. </br>
In addition, I used <strong>XCode 9.3</strong> as an IDE to develop my app which made it really easy to design the UI and also made the app compatible with the latest versions of iOS.

## GitHub API

To get the most starred Github repos created in the last 30 days (relative to 2017-11-22) I call the following endpoint : </br>
`https://api.github.com/search/repositories?q=created:>2017-10-22&sort=stars&order=desc` </br>
You can read more about the Github API over [here](https://developer.github.com/v3/search/#search-repositories).

## Example

This is an example run of the app from 28/05/2018: </br>

<img src="https://github.com/othmane-mahfoud/GitStars/blob/master/Example.png" height="640" width="375">

## Thoughts?

If you have any questions or feedback about my app, feel free to contact me: **mahfoud.othmane97@gmail.com** :e-mail:
