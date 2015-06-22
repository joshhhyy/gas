
// GitHub API variable defaults
var reposUrl; 
var repoIDs = [];
var username;
var userCommits = [];
var allCommits;

$(document).ready(function() {

// GITHUB API SCRIPT 

  var getRepos = function() {
    $.getJSON(reposUrl, {
    }).done(function (results) {
      $('<p>Github Username: ' + username + '</p>').prependTo('.github');

      $(results).each(function () {
        var repo = this.name;
        var $repoName = $('<p>').text(repo);
        $repoName.appendTo('.github');
        commitsUrl = "https://api.github.com/repos/" + username + "/" + repo + "/" + "commits";
        $.getJSON(commitsUrl, {
        }).done(function (commitResults) {
          allCommits = commitResults;
          $(allCommits).each(function () {
            if (this.committer !== null) {
              if (this.committer.login === username) {
                userCommits.push("{" + repo + " : " + this.commit.message + "}");
                var message = this.commit.message;
                var $commitMessage = $('<p>').text(message);
                $commitMessage.appendTo('.github');
              };
            };
          });
        });
      });
    });
  };

  var getUser = function() {

    var email = gon.user.email
    var gitUrl = "https://api.github.com/search/users"

    $.getJSON(gitUrl, {
      q: email,
      in: "email"
    }).done(function (results) {
      if (results.total_count < 1) {
        var notice = $('<p>Please set your email address to public in your GitHub account settings.</p>')
        $(notice).prependTo('.github')
      } else {
        var githubAvatarUrl = results.items[0].avatar_url;
        username = results.items[0].login;
        reposUrl = results.items[0].repos_url;
        var githubAvatar = $('<img>').addClass('githubAvatar').attr('src', githubAvatarUrl);
        $(githubAvatar).prependTo('.github');
        getRepos();
      }
    })
  }


  // API FUNCTION CALLS
  getUser();


});