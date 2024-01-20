user="ssmithy";
repo="NetDaemon";

#avoid spamming error
read -r -d '' apiLatest << EOM
{
  "url": "https://api.github.com/repos/ssmithy/NetDaemon/releases/137639334",
  "assets_url": "https://api.github.com/repos/ssmithy/NetDaemon/releases/137639334/assets",
  "upload_url": "https://uploads.github.com/repos/ssmithy/NetDaemon/releases/137639334/assets{?name,label}",
  "html_url": "https://github.com/ssmithy/NetDaemon/releases/tag/0.0.1-main.1.350f67a",
  "id": 137639334,
  "author": {
    "login": "github-actions[bot]",
    "id": 41898282,
    "node_id": "MDM6Qm90NDE4OTgyODI=",
    "avatar_url": "https://avatars.githubusercontent.com/in/15368?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/github-actions%5Bbot%5D",
    "html_url": "https://github.com/apps/github-actions",
    "followers_url": "https://api.github.com/users/github-actions%5Bbot%5D/followers",
    "following_url": "https://api.github.com/users/github-actions%5Bbot%5D/following{/other_user}",
    "gists_url": "https://api.github.com/users/github-actions%5Bbot%5D/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/github-actions%5Bbot%5D/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/github-actions%5Bbot%5D/subscriptions",
    "organizations_url": "https://api.github.com/users/github-actions%5Bbot%5D/orgs",
    "repos_url": "https://api.github.com/users/github-actions%5Bbot%5D/repos",
    "events_url": "https://api.github.com/users/github-actions%5Bbot%5D/events{/privacy}",
    "received_events_url": "https://api.github.com/users/github-actions%5Bbot%5D/received_events",
    "type": "Bot",
    "site_admin": false
  },
  "node_id": "RE_kwDOLGOh9c4INDWm",
  "tag_name": "0.0.1-main.1.350f67a",
  "target_commitish": "main",
  "name": "0.0.1-main.1.350f67a",
  "draft": false,
  "prerelease": false,
  "created_at": "2024-01-18T22:10:32Z",
  "published_at": "2024-01-18T22:11:06Z",
  "assets": [
    {
      "url": "https://api.github.com/repos/ssmithy/NetDaemon/releases/assets/146410526",
      "id": 146410526,
      "node_id": "RA_kwDOLGOh9c4Iugwe",
      "name": "publish.zip",
      "label": "",
      "uploader": {
        "login": "github-actions[bot]",
        "id": 41898282,
        "node_id": "MDM6Qm90NDE4OTgyODI=",
        "avatar_url": "https://avatars.githubusercontent.com/in/15368?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/github-actions%5Bbot%5D",
        "html_url": "https://github.com/apps/github-actions",
        "followers_url": "https://api.github.com/users/github-actions%5Bbot%5D/followers",
        "following_url": "https://api.github.com/users/github-actions%5Bbot%5D/following{/other_user}",
        "gists_url": "https://api.github.com/users/github-actions%5Bbot%5D/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/github-actions%5Bbot%5D/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/github-actions%5Bbot%5D/subscriptions",
        "organizations_url": "https://api.github.com/users/github-actions%5Bbot%5D/orgs",
        "repos_url": "https://api.github.com/users/github-actions%5Bbot%5D/repos",
        "events_url": "https://api.github.com/users/github-actions%5Bbot%5D/events{/privacy}",
        "received_events_url": "https://api.github.com/users/github-actions%5Bbot%5D/received_events",
        "type": "Bot",
        "site_admin": false
      },
      "content_type": "application/zip",
      "state": "uploaded",
      "size": 935339,
      "download_count": 1,
      "created_at": "2024-01-18T22:11:06Z",
      "updated_at": "2024-01-18T22:11:06Z",
      "browser_download_url": "https://github.com/ssmithy/NetDaemon/releases/download/0.0.1-main.1.350f67a/publish.zip"
    }
  ],
  "tarball_url": "https://api.github.com/repos/ssmithy/NetDaemon/tarball/0.0.1-main.1.350f67a",
  "zipball_url": "https://api.github.com/repos/ssmithy/NetDaemon/zipball/0.0.1-main.1.350f67a",
  "body": ""
}
EOM
#apiLatest=$(curl -s https://api.github.com/repos/${user}/${repo}/releases/latest)

releaseTag=$(jq -r .tag_name <<< $apiLatest)
echo 'Current Version:' $releaseTag

assetDownloadUrl=$(jq -r .assets[0].browser_download_url <<< $apiLatest)
#echo 'Download URL:' $assetDownloadUrl

#if list of folders does not contain releaseTag
# do update routine

#TODO: delete x older folders

#create a new folder
mkdir ./$releaseTag
cd $releaseTag
#download and extract publish.zip
curl -LO $assetDownloadUrl
unzip -o publish.zip
rm publish.zip

#ssh into automation server? / Cert instructions in readme
#copy files to run dir
#restart service