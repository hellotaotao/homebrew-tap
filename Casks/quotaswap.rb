cask "quotaswap" do
  version "0.1.0"
  sha256 "b91123b1134e8006cc7a6be62211d030dcde0268faabe21fcf8522368f7f7b8c"

  url "https://github.com/hellotaotao/QuotaSwap/releases/download/v#{version}/QuotaSwap-#{version}.dmg"
  name "QuotaSwap"
  desc "Switch Claude desktop accounts and watch each account's usage"
  homepage "https://github.com/hellotaotao/QuotaSwap"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "QuotaSwap.app"
  binary "#{appdir}/QuotaSwap.app/Contents/MacOS/QuotaSwap", target: "quotaswap"

  uninstall quit: "au.taotao.quotaswap"

  zap trash: [
    "~/Library/Application Support/Claude-accounts",
    "~/Library/Application Support/QuotaSwap",
  ]
end
