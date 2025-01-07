cask "bluestacks-air" do
  arch arm: "mac-arm"

  version "5.21.670.7509,6c973c3d266b456bbe61dbfc32c1d5db"
  sha256 :no_check

  name "BlueStacks Air"
  desc "BlueStacks Air Beta for Mac"
  url "https://ak-build.bluestacks.com/public/app-player/mac/nxt_mac2/#{version.csv.first}/#{version.csv.second}/BlueStacks_#{version.csv.first}.dmg"
  homepage "https://www.bluestacks.com/mac"

  # https://github.com/Homebrew/homebrew-cask/blob/71e08ccebc2e39e65e69d462d1a36073a1afc708/Casks/b/bluestacks.rb#L10
  livecheck do
    url "https://cloud.bluestacks.com/api/getdownloadnow?platform=mac&win_version=&mac_version=#{MacOS.full_version}"
    regex(%r{/(\d+(?:\.\d+)*)/([^/]+)/}i)
    strategy :header_match do |headers, regex|
      match = headers["location"]&.match(regex)
      next if match.blank?

      "#{match[1]},#{match[2]}"
    end
  end

  depends_on macos: ">= :sonoma"

  app "BlueStacks.app"

  zap trash: [
    "~/Library/Preferences/com.now.gg.BlueStacks.plist",
    "~/Library/Saved Application State/com.now.gg.BlueStacks.savedState",
    "~/Library/HTTPStorages/com.now.gg.BlueStacks",
  ]
end
