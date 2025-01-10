cask "bluestacks-air" do
  arch arm: "mac-arm"

  version "5.21.675.7520,dd393d1267864cd48bb3a7091ea1c8a6"
  sha256 :no_check

  url "https://ak-build.bluestacks.com/public/app-player/mac/nxt_mac2/#{version.csv.first}/#{version.csv.second}/BlueStacks_#{version.csv.first}.dmg"
  name "BlueStacks Air"
  desc "BlueStacks Air Beta for Mac"
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
    "~/Library/HTTPStorages/com.now.gg.BlueStacks",
    "~/Library/Preferences/com.now.gg.BlueStacks.plist",
    "~/Library/Saved Application State/com.now.gg.BlueStacks.savedState",
  ]
end
