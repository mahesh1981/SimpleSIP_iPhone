<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="2.0" toolsVersion="3084" systemVersion="12D78" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" initialViewController="Xd9-yV-o8P">
<dependencies>
<plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="2083"/>
</dependencies>
<scenes>
<!--View Controller-->
<scene sceneID="fUD-9P-scP">
<objects>
<viewController id="Xd9-yV-o8P" customClass="ViewController" sceneMemberID="viewController">
<view key="view" contentMode="scaleAspectFill" id="Bdd-Lh-YIK">
<rect key="frame" x="0.0" y="20" width="320" height="460"/>
<autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
<subviews>
<textField opaque="NO" clipsSubviews="YES" contentMode="scaleToFill" contentHorizontalAlignment="left" contentVerticalAlignment="center" borderStyle="roundedRect" minimumFontSize="17" translatesAutoresizingMaskIntoConstraints="NO" id="QWN-EV-n1R">
<constraints>
<constraint firstAttribute="width" constant="155" id="6vd-Hy-ISv"/>
</constraints>
<fontDescription key="fontDescription" type="system" pointSize="14"/>
<textInputTraits key="textInputTraits" autocorrectionType="no" returnKeyType="done" enablesReturnKeyAutomatically="YES"/>
<connections>
<outlet property="delegate" destination="Xd9-yV-o8P" id="UpU-ry-awN"/>
</connections>
</textField>
<textField opaque="NO" clipsSubviews="YES" contentMode="scaleToFill" contentHorizontalAlignment="left" contentVerticalAlignment="center" borderStyle="roundedRect" minimumFontSize="17" translatesAutoresizingMaskIntoConstraints="NO" id="4zr-MA-Kp6">
<constraints>
<constraint firstAttribute="width" constant="64" id="386-1C-DBI"/>
</constraints>
<fontDescription key="fontDescription" type="system" pointSize="14"/>
<textInputTraits key="textInputTraits" autocorrectionType="no" keyboardType="numberPad" returnKeyType="done" enablesReturnKeyAutomatically="YES"/>
<connections>
<outlet property="delegate" destination="Xd9-yV-o8P" id="4Xv-Yr-4zW"/>
</connections>
</textField>
<button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="fNM-v7-h58">
<constraints>
<constraint firstAttribute="width" constant="107" id="Fzu-7U-wEp"/>
</constraints>
<fontDescription key="fontDescription" type="boldSystem" pointSize="15"/>
<state key="normal" title="Call">
<color key="titleColor" red="0.19607843459999999" green="0.30980393290000002" blue="0.52156865600000002" alpha="1" colorSpace="calibratedRGB"/>
<color key="titleShadowColor" white="0.5" alpha="1" colorSpace="calibratedWhite"/>
</state>
<state key="highlighted">
<color key="titleColor" white="1" alpha="1" colorSpace="calibratedWhite"/>
</state>
<connections>
<action selector="callUser:" destination="Xd9-yV-o8P" eventType="touchUpInside" id="URI-Zv-JQq"/>
</connections>
</button>
<button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="p41-2P-Fa7">
<constraints>
<constraint firstAttribute="width" constant="300" id="EDr-4A-iiV"/>
<constraint firstAttribute="height" constant="66" id="OwU-mh-2jP"/>
</constraints>
<fontDescription key="fontDescription" type="boldSystem" pointSize="15"/>
<state key="normal" backgroundImage="fb.png">
<color key="titleColor" red="0.19607843459999999" green="0.30980393290000002" blue="0.52156865600000002" alpha="1" colorSpace="calibratedRGB"/>
<color key="titleShadowColor" white="0.5" alpha="1" colorSpace="calibratedWhite"/>
</state>
<state key="highlighted">
<color key="titleColor" white="1" alpha="1" colorSpace="calibratedWhite"/>
</state>
<connections>
<action selector="fbLogin:" destination="Xd9-yV-o8P" eventType="touchUpInside" id="9q6-BZ-CQD"/>
</connections>
</button>
<tableView clipsSubviews="YES" contentMode="scaleToFill" alwaysBounceVertical="YES" dataMode="prototypes" style="plain" rowHeight="44" sectionHeaderHeight="22" sectionFooterHeight="22" translatesAutoresizingMaskIntoConstraints="NO" id="wbO-wY-si5">
<color key="backgroundColor" white="1" alpha="1" colorSpace="calibratedWhite"/>
<constraints>
<constraint firstAttribute="height" constant="302" id="IeQ-aQ-kL9"/>
</constraints>
<prototypes>
<tableViewCell contentMode="scaleToFill" selectionStyle="blue" hidesAccessoryWhenEditing="NO" indentationLevel="1" indentationWidth="0.0" reuseIdentifier="Friend" textLabel="hzn-f1-er7" detailTextLabel="Nwm-dZ-jxB" style="IBUITableViewCellStyleSubtitle" id="Mdg-ww-5ul">
<rect key="frame" x="0.0" y="22" width="320" height="44"/>
<autoresizingMask key="autoresizingMask"/>
<view key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center">
<rect key="frame" x="0.0" y="0.0" width="320" height="43"/>
<autoresizingMask key="autoresizingMask"/>
<subviews>
<label opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="left" text="Title" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" id="hzn-f1-er7">
<rect key="frame" x="10" y="2" width="38" height="22"/>
<fontDescription key="fontDescription" type="boldSystem" pointSize="18"/>
<color key="textColor" cocoaTouchSystemColor="darkTextColor"/>
<color key="highlightedColor" red="1" green="1" blue="1" alpha="1" colorSpace="calibratedRGB"/>
</label>
<label opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="left" text="Subtitle" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" id="Nwm-dZ-jxB">
<rect key="frame" x="10" y="24" width="47" height="18"/>
<fontDescription key="fontDescription" type="system" pointSize="14"/>
<color key="textColor" red="0.50196078430000002" green="0.50196078430000002" blue="0.50196078430000002" alpha="1" colorSpace="calibratedRGB"/>
<color key="highlightedColor" red="1" green="1" blue="1" alpha="1" colorSpace="calibratedRGB"/>
</label>
</subviews>
<color key="backgroundColor" white="0.0" alpha="0.0" colorSpace="calibratedWhite"/>
</view>
</tableViewCell>
</prototypes>
<connections>
<outlet property="dataSource" destination="Xd9-yV-o8P" id="KgH-Xb-pej"/>
<outlet property="delegate" destination="Xd9-yV-o8P" id="taT-hZ-Ndt"/>
</connections>
</tableView>
<label opaque="NO" clipsSubviews="YES" userInteractionEnabled="NO" contentMode="left" text="Connecting" textAlignment="center" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="Y96-vu-leA">
<color key="backgroundColor" red="1" green="0.81237462675016792" blue="0.26226345212954938" alpha="1" colorSpace="calibratedRGB"/>
<constraints>

<constraint firstAttribute="height" constant="32" id="Wt2-yF-Eyj"/>
</constraints>
<fontDescription key="fontDescription" type="system" pointSize="20"/>

<fontDescription key="fontDescription" type="system" pointSize="14"/>

<color key="textColor" red="0.047896074970000001" green="0.61432465400000003" blue="0.64179262910000001" alpha="1" colorSpace="calibratedRGB"/>
<nil key="highlightedColor"/>
</label>
<button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="aNP-cb-8pP">
<fontDescription key="fontDescription" type="boldSystem" pointSize="15"/>
<state key="normal" title="Dial Number">
<color key="titleColor" red="0.19607843459999999" green="0.30980393290000002" blue="0.52156865600000002" alpha="1" colorSpace="calibratedRGB"/>
<color key="titleShadowColor" white="0.5" alpha="1" colorSpace="calibratedWhite"/>
</state>
<state key="highlighted">
<color key="titleColor" white="1" alpha="1" colorSpace="calibratedWhite"/>
</state>
<connections>
<action selector="dialNumber:" destination="Xd9-yV-o8P" eventType="touchUpInside" id="6tI-Bp-uzI"/>
</connections>
</button>
<button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="6L3-5b-bwV">
<constraints>
<constraint firstAttribute="width" constant="155" id="kDh-ko-527"/>
</constraints>
<fontDescription key="fontDescription" type="boldSystem" pointSize="15"/>
<state key="normal" title="Reject">
<color key="titleColor" red="0.19607843459999999" green="0.30980393290000002" blue="0.52156865600000002" alpha="1" colorSpace="calibratedRGB"/>
<color key="titleShadowColor" white="0.5" alpha="1" colorSpace="calibratedWhite"/>
</state>
<state key="highlighted">
<color key="titleColor" white="1" alpha="1" colorSpace="calibratedWhite"/>
</state>
</button>
<button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="dDS-NV-isG">
<constraints>
<constraint firstAttribute="width" constant="147" id="33t-DF-ecz"/>
</constraints>
<fontDescription key="fontDescription" type="boldSystem" pointSize="15"/>
<state key="normal" title="Answer">
<color key="titleColor" red="0.19607843459999999" green="0.30980393290000002" blue="0.52156865600000002" alpha="1" colorSpace="calibratedRGB"/>
<color key="titleShadowColor" white="0.5" alpha="1" colorSpace="calibratedWhite"/>
</state>
<state key="highlighted">
<color key="titleColor" white="1" alpha="1" colorSpace="calibratedWhite"/>
</state>
</button>
</subviews>
<color key="backgroundColor" white="1" alpha="1" colorSpace="custom" customColorSpace="calibratedWhite"/>
<constraints>
<constraint firstItem="aNP-cb-8pP" firstAttribute="leading" secondItem="dDS-NV-isG" secondAttribute="leading" type="default" id="9CI-qN-jXC"/>
<constraint firstItem="Y96-vu-leA" firstAttribute="trailing" secondItem="Bdd-Lh-YIK" secondAttribute="trailing" type="default" id="9Qw-5C-8aa"/>
<constraint firstAttribute="bottom" secondItem="QWN-EV-n1R" secondAttribute="bottom" constant="93" id="9mX-KE-8q6"/>
<constraint firstItem="6L3-5b-bwV" firstAttribute="leading" secondItem="Bdd-Lh-YIK" secondAttribute="leading" constant="2" id="IhT-2T-Nc5"/>
<constraint firstAttribute="trailing" secondItem="4zr-MA-Kp6" secondAttribute="trailing" constant="53" id="KpZ-S8-mkn"/>
<constraint firstAttribute="bottom" secondItem="fNM-v7-h58" secondAttribute="bottom" constant="24" id="M0i-pO-VfP"/>
<constraint firstAttribute="bottom" secondItem="6L3-5b-bwV" secondAttribute="bottom" constant="123" id="Nza-4n-O0x"/>
<constraint firstItem="p41-2P-Fa7" firstAttribute="trailing" secondItem="Bdd-Lh-YIK" secondAttribute="trailing" type="default" id="PKn-Si-Dl8"/>
<constraint firstItem="QWN-EV-n1R" firstAttribute="centerX" secondItem="fNM-v7-h58" secondAttribute="centerX" type="default" id="PLN-Pc-y58"/>
<constraint firstItem="aNP-cb-8pP" firstAttribute="baseline" secondItem="fNM-v7-h58" secondAttribute="baseline" type="default" id="Vax-xc-Va7"/>
<constraint firstItem="wbO-wY-si5" firstAttribute="top" secondItem="Y96-vu-leA" secondAttribute="bottom" constant="8" symbolic="YES" type="default" id="Xub-Ur-Tsk"/>
<constraint firstItem="p41-2P-Fa7" firstAttribute="top" secondItem="Bdd-Lh-YIK" secondAttribute="top" constant="38" id="Y5e-h4-kq0"/>
<constraint firstItem="wbO-wY-si5" firstAttribute="trailing" secondItem="Bdd-Lh-YIK" secondAttribute="trailing" type="default" id="dFn-zq-JWe"/>
<constraint firstItem="Y96-vu-leA" firstAttribute="top" secondItem="Bdd-Lh-YIK" secondAttribute="top" type="default" id="jHQ-lt-C2e"/>
<constraint firstItem="wbO-wY-si5" firstAttribute="leading" secondItem="Bdd-Lh-YIK" secondAttribute="leading" type="default" id="jj9-kM-58y"/>
<constraint firstItem="dDS-NV-isG" firstAttribute="trailing" secondItem="Bdd-Lh-YIK" secondAttribute="trailing" type="default" id="k4S-56-6ih"/>
<constraint firstItem="dDS-NV-isG" firstAttribute="baseline" secondItem="6L3-5b-bwV" secondAttribute="baseline" type="default" id="nNs-Ab-6SD"/>
<constraint firstItem="QWN-EV-n1R" firstAttribute="leading" secondItem="Bdd-Lh-YIK" secondAttribute="leading" constant="31" id="pp5-R7-8V1"/>
<constraint firstItem="p41-2P-Fa7" firstAttribute="leading" secondItem="Bdd-Lh-YIK" secondAttribute="leading" type="default" id="qXi-1k-8TQ"/>

<constraint firstItem="wbO-wY-si5" firstAttribute="bottom" secondItem="Bdd-Lh-YIK" secondAttribute="bottom" type="default" id="2gp-Tw-UaV"/>
<constraint firstItem="fNM-v7-h58" firstAttribute="leading" secondItem="Bdd-Lh-YIK" secondAttribute="leading" constant="50" id="2zt-kQ-ji9"/>
<constraint firstItem="fNM-v7-h58" firstAttribute="top" secondItem="Bdd-Lh-YIK" secondAttribute="top" constant="89" id="5i8-bx-bme"/>
<constraint firstAttribute="trailing" secondItem="4zr-MA-Kp6" secondAttribute="trailing" constant="47" id="9Xx-tI-tm6"/>
<constraint firstItem="Y96-vu-leA" firstAttribute="trailing" secondItem="Bdd-Lh-YIK" secondAttribute="trailing" type="default" id="TVy-Sw-jOf"/>
<constraint firstItem="aNP-cb-8pP" firstAttribute="baseline" secondItem="fNM-v7-h58" secondAttribute="baseline" type="default" id="Vax-xc-Va7"/>
<constraint firstItem="QWN-EV-n1R" firstAttribute="top" secondItem="Bdd-Lh-YIK" secondAttribute="top" constant="45" id="a79-6c-pk4"/>
<constraint firstItem="QWN-EV-n1R" firstAttribute="leading" secondItem="Bdd-Lh-YIK" secondAttribute="leading" constant="14" id="avX-9A-da9"/>
<constraint firstItem="p41-2P-Fa7" firstAttribute="top" secondItem="Bdd-Lh-YIK" secondAttribute="top" constant="31" id="cnx-IP-9qz"/>
<constraint firstItem="wbO-wY-si5" firstAttribute="trailing" secondItem="Bdd-Lh-YIK" secondAttribute="trailing" type="default" id="dFn-zq-JWe"/>
<constraint firstAttribute="trailing" secondItem="aNP-cb-8pP" secondAttribute="trailing" constant="34" id="fg4-f6-EfC"/>
<constraint firstItem="Y96-vu-leA" firstAttribute="top" secondItem="Bdd-Lh-YIK" secondAttribute="top" type="default" id="jHQ-lt-C2e"/>
<constraint firstItem="wbO-wY-si5" firstAttribute="leading" secondItem="Bdd-Lh-YIK" secondAttribute="leading" type="default" id="jj9-kM-58y"/>
<constraint firstItem="p41-2P-Fa7" firstAttribute="centerX" secondItem="Y96-vu-leA" secondAttribute="centerX" type="default" id="m0L-8M-c0o"/>

<constraint firstItem="4zr-MA-Kp6" firstAttribute="baseline" secondItem="QWN-EV-n1R" secondAttribute="baseline" type="default" id="s5v-GA-T4D"/>
<constraint firstItem="Y96-vu-leA" firstAttribute="leading" secondItem="Bdd-Lh-YIK" secondAttribute="leading" type="default" id="veP-FH-kdZ"/>
</constraints>
</view>
<simulatedScreenMetrics key="simulatedDestinationMetrics"/>
<connections>
<outlet property="answerButton" destination="dDS-NV-isG" id="2hJ-kh-6hm"/>
<outlet property="callButton" destination="fNM-v7-h58" id="f2V-Gr-tun"/>
<outlet property="callUser" destination="QWN-EV-n1R" id="dhH-zQ-zCN"/>


<outlet property="dialNum" destination="aNP-cb-8pP" id="632-1G-QQK"/>

<outlet property="loginButton" destination="p41-2P-Fa7" id="Uvr-5T-dhG"/>
<outlet property="numberField" destination="4zr-MA-Kp6" id="Hcu-MB-myT"/>
<outlet property="rejectButton" destination="6L3-5b-bwV" id="P4m-YM-Gq0"/>
<outlet property="statusLabel" destination="Y96-vu-leA" id="6KV-d9-YLC"/>
<outlet property="table" destination="wbO-wY-si5" id="VRZ-ob-6Cx"/>
<segue destination="QNJ-yx-Fz7" kind="modal" identifier="Login" id="eKn-iR-5Wd"/>
<segue destination="ygO-26-SDo" kind="push" identifier="TableView" id="hVC-rB-Thm"/>
</connections>
</viewController>
<placeholder placeholderIdentifier="IBFirstResponder" id="ere-dM-w32" sceneMemberID="firstResponder"/>
</objects>
<point key="canvasLocation" x="-182" y="-697"/>
</scene>
<!--Main Page-->
<scene sceneID="3eS-Xd-cH2">
<objects>
<viewController storyboardIdentifier="MainPageID" id="QNJ-yx-Fz7" customClass="MainPage" sceneMemberID="viewController">
<view key="view" contentMode="scaleToFill" horizontalHuggingPriority="1000" verticalHuggingPriority="1000" id="5gt-3Z-EX7">
<rect key="frame" x="0.0" y="20" width="320" height="548"/>
<autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
<subviews>
<tableView clipsSubviews="YES" contentMode="scaleToFill" alwaysBounceVertical="YES" dataMode="prototypes" style="plain" rowHeight="44" sectionHeaderHeight="22" sectionFooterHeight="22" translatesAutoresizingMaskIntoConstraints="NO" id="Qlx-ZC-Frh">
<color key="backgroundColor" white="1" alpha="1" colorSpace="calibratedWhite"/>
<constraints>
<constraint firstAttribute="height" constant="220" id="TG1-8b-8g1"/>
</constraints>
<prototypes>
<tableViewCell contentMode="scaleToFill" selectionStyle="blue" hidesAccessoryWhenEditing="NO" indentationLevel="1" indentationWidth="0.0" reuseIdentifier="Friend" textLabel="DD6-NS-CBP" detailTextLabel="hF7-wg-B00" style="IBUITableViewCellStyleSubtitle" id="EQZ-Uy-ZfJ">
<rect key="frame" x="0.0" y="22" width="280" height="44"/>
<autoresizingMask key="autoresizingMask"/>
<view key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center">
<rect key="frame" x="0.0" y="0.0" width="280" height="43"/>
<autoresizingMask key="autoresizingMask"/>
<subviews>
<label opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="left" text="Title" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" id="DD6-NS-CBP">
<rect key="frame" x="10" y="2" width="38" height="22"/>
<fontDescription key="fontDescription" type="boldSystem" pointSize="18"/>
<color key="textColor" cocoaTouchSystemColor="darkTextColor"/>
<color key="highlightedColor" red="1" green="1" blue="1" alpha="1" colorSpace="calibratedRGB"/>
</label>
<label opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="left" text="Subtitle" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" id="hF7-wg-B00">
<rect key="frame" x="10" y="24" width="47" height="18"/>
<fontDescription key="fontDescription" type="system" pointSize="14"/>
<color key="textColor" red="0.50196078430000002" green="0.50196078430000002" blue="0.50196078430000002" alpha="1" colorSpace="calibratedRGB"/>
<color key="highlightedColor" red="1" green="1" blue="1" alpha="1" colorSpace="calibratedRGB"/>
</label>
</subviews>
<color key="backgroundColor" white="0.0" alpha="0.0" colorSpace="calibratedWhite"/>
</view>
</tableViewCell>
</prototypes>
<connections>
<outlet property="dataSource" destination="QNJ-yx-Fz7" id="qb3-Kw-ewM"/>
<outlet property="delegate" destination="QNJ-yx-Fz7" id="d07-Je-21E"/>
</connections>
</tableView>
<button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="Y0w-gT-7xt">
<constraints>
<constraint firstAttribute="width" constant="109" id="B8I-QW-HXL"/>
<constraint firstAttribute="height" constant="28" id="Mtb-dr-Voo"/>
</constraints>
<fontDescription key="fontDescription" type="boldSystem" pointSize="15"/>
<state key="normal" title="Answer">
<color key="titleColor" red="0.19607843459999999" green="0.30980393290000002" blue="0.52156865600000002" alpha="1" colorSpace="calibratedRGB"/>
<color key="titleShadowColor" white="0.5" alpha="1" colorSpace="calibratedWhite"/>
</state>
<state key="highlighted">
<color key="titleColor" white="1" alpha="1" colorSpace="calibratedWhite"/>
</state>
<connections>
<action selector="answerPressed:" destination="QNJ-yx-Fz7" eventType="touchUpInside" id="v6M-vK-jkc"/>
</connections>
</button>
<button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="cGx-tv-t1S">
<constraints>
<constraint firstAttribute="height" constant="30" id="3xN-Mr-YIr"/>
<constraint firstAttribute="width" constant="87" id="caa-TU-ckS"/>
</constraints>
<fontDescription key="fontDescription" type="boldSystem" pointSize="15"/>
<state key="normal" title="Call">
<color key="titleColor" red="0.19607843459999999" green="0.30980393290000002" blue="0.52156865600000002" alpha="1" colorSpace="calibratedRGB"/>
<color key="titleShadowColor" white="0.5" alpha="1" colorSpace="calibratedWhite"/>
</state>
<state key="highlighted">
<color key="titleColor" white="1" alpha="1" colorSpace="calibratedWhite"/>
</state>
<connections>
<action selector="callNumber:" destination="QNJ-yx-Fz7" eventType="touchUpInside" id="qz0-H2-IE4"/>
</connections>
</button>
<button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="contactAdd" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="0Oo-XX-FKf">
<fontDescription key="fontDescription" type="boldSystem" pointSize="15"/>
<state key="normal">
<color key="titleColor" red="0.19607843459999999" green="0.30980393290000002" blue="0.52156865600000002" alpha="1" colorSpace="calibratedRGB"/>
<color key="titleShadowColor" white="0.5" alpha="1" colorSpace="calibratedWhite"/>
</state>
<state key="highlighted">
<color key="titleColor" white="1" alpha="1" colorSpace="calibratedWhite"/>
</state>
<connections>
<action selector="addBuddy:" destination="QNJ-yx-Fz7" eventType="touchUpInside" id="Kty-yA-iLF"/>
</connections>
</button>
<label opaque="NO" clipsSubviews="YES" userInteractionEnabled="NO" contentMode="left" text="Friends" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="Vlu-B8-QBM">
<fontDescription key="fontDescription" type="system" pointSize="17"/>
<color key="textColor" cocoaTouchSystemColor="darkTextColor"/>
<nil key="highlightedColor"/>
</label>
<textField opaque="NO" clipsSubviews="YES" contentMode="scaleToFill" contentHorizontalAlignment="left" contentVerticalAlignment="center" borderStyle="roundedRect" minimumFontSize="17" translatesAutoresizingMaskIntoConstraints="NO" id="gDt-7s-ZPN">
<constraints>
<constraint firstAttribute="width" constant="179" id="okC-KA-hCI"/>
</constraints>
<fontDescription key="fontDescription" type="system" pointSize="14"/>
<textInputTraits key="textInputTraits" keyboardType="numbersAndPunctuation" returnKeyType="done" enablesReturnKeyAutomatically="YES"/>
<connections>
<outlet property="delegate" destination="QNJ-yx-Fz7" id="rGu-da-m01"/>
</connections>
</textField>
<textField opaque="NO" clipsSubviews="YES" contentMode="scaleToFill" contentHorizontalAlignment="left" contentVerticalAlignment="center" text="sip:bhartesh@dev.socialcallz.net" borderStyle="roundedRect" minimumFontSize="17" translatesAutoresizingMaskIntoConstraints="NO" id="sUx-85-Rj8">
<fontDescription key="fontDescription" type="system" pointSize="14"/>
<textInputTraits key="textInputTraits" returnKeyType="done" enablesReturnKeyAutomatically="YES"/>
<connections>
<outlet property="delegate" destination="QNJ-yx-Fz7" id="a3C-1h-Twv"/>
</connections>
</textField>
<button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="khS-Z9-AUg">
<fontDescription key="fontDescription" type="boldSystem" pointSize="15"/>
<state key="normal" title="Refresh Friends">
<color key="titleColor" red="0.19607843459999999" green="0.30980393290000002" blue="0.52156865600000002" alpha="1" colorSpace="calibratedRGB"/>
<color key="titleShadowColor" white="0.5" alpha="1" colorSpace="calibratedWhite"/>
</state>
<state key="highlighted">
<color key="titleColor" white="1" alpha="1" colorSpace="calibratedWhite"/>
</state>
<connections>
<action selector="refreshBuddies:" destination="QNJ-yx-Fz7" eventType="touchUpInside" id="3xW-4P-Tt1"/>
</connections>
</button>
<textField opaque="NO" clipsSubviews="YES" contentMode="scaleToFill" contentHorizontalAlignment="left" contentVerticalAlignment="center" borderStyle="roundedRect" minimumFontSize="17" translatesAutoresizingMaskIntoConstraints="NO" id="u94-gZ-jA3">
<constraints>
<constraint firstAttribute="width" constant="189" id="D8J-mL-DCI"/>
</constraints>
<fontDescription key="fontDescription" type="system" pointSize="14"/>
<textInputTraits key="textInputTraits"/>
</textField>
<button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="SL5-De-b5W">
<fontDescription key="fontDescription" type="boldSystem" pointSize="15"/>
<state key="normal" title="Send">
<color key="titleColor" red="0.19607843459999999" green="0.30980393290000002" blue="0.52156865600000002" alpha="1" colorSpace="calibratedRGB"/>
<color key="titleShadowColor" white="0.5" alpha="1" colorSpace="calibratedWhite"/>
</state>
<state key="highlighted">
<color key="titleColor" white="1" alpha="1" colorSpace="calibratedWhite"/>
</state>
<connections>
<action selector="sendMessage:" destination="QNJ-yx-Fz7" eventType="touchUpInside" id="qDB-oi-QPP"/>
</connections>
</button>
</subviews>
<color key="backgroundColor" white="0.66666666666666663" alpha="1" colorSpace="calibratedWhite"/>
<constraints>
<constraint firstAttribute="bottom" secondItem="khS-Z9-AUg" secondAttribute="bottom" constant="18" id="3gH-Wq-6mV"/>
<constraint firstAttribute="trailing" secondItem="0Oo-XX-FKf" secondAttribute="trailing" constant="22" id="3zW-kM-nN7"/>
<constraint firstItem="gDt-7s-ZPN" firstAttribute="leading" secondItem="5gt-3Z-EX7" secondAttribute="leading" constant="20" symbolic="YES" type="default" id="4Iw-nn-O0v"/>
<constraint firstItem="u94-gZ-jA3" firstAttribute="leading" secondItem="5gt-3Z-EX7" secondAttribute="leading" constant="20" symbolic="YES" type="default" id="6n9-QW-1u5"/>
<constraint firstItem="cGx-tv-t1S" firstAttribute="top" secondItem="5gt-3Z-EX7" secondAttribute="top" constant="24" id="7wf-cF-56z"/>
<constraint firstAttribute="trailing" secondItem="SL5-De-b5W" secondAttribute="trailing" constant="27" id="9XX-W3-EYn"/>
<constraint firstItem="gDt-7s-ZPN" firstAttribute="baseline" secondItem="cGx-tv-t1S" secondAttribute="baseline" type="default" id="9yr-wq-Btx"/>
<constraint firstItem="gDt-7s-ZPN" firstAttribute="top" secondItem="5gt-3Z-EX7" secondAttribute="top" constant="25" id="Dxc-3C-q8g"/>
<constraint firstAttribute="bottom" secondItem="Y0w-gT-7xt" secondAttribute="bottom" constant="94" id="EsU-Uh-zqf"/>
<constraint firstItem="Y0w-gT-7xt" firstAttribute="centerX" secondItem="Vlu-B8-QBM" secondAttribute="centerX" type="default" id="H9J-hP-7Vq"/>
<constraint firstItem="Y0w-gT-7xt" firstAttribute="leading" secondItem="5gt-3Z-EX7" secondAttribute="leading" constant="117" id="Inh-j1-Wix"/>
<constraint firstItem="SL5-De-b5W" firstAttribute="top" secondItem="5gt-3Z-EX7" secondAttribute="top" constant="63" id="Ixw-QF-BLY"/>
<constraint firstItem="khS-Z9-AUg" firstAttribute="centerX" secondItem="Qlx-ZC-Frh" secondAttribute="centerX" type="default" id="JOW-A5-3Ht"/>
<constraint firstItem="Vlu-B8-QBM" firstAttribute="top" secondItem="5gt-3Z-EX7" secondAttribute="top" constant="113" id="L81-xT-J8H"/>
<constraint firstItem="sUx-85-Rj8" firstAttribute="leading" secondItem="5gt-3Z-EX7" secondAttribute="leading" constant="38" id="P9J-Ny-Gvo"/>
<constraint firstItem="sUx-85-Rj8" firstAttribute="top" secondItem="5gt-3Z-EX7" secondAttribute="top" constant="137" id="ReV-a7-S01"/>
<constraint firstItem="Qlx-ZC-Frh" firstAttribute="top" secondItem="0Oo-XX-FKf" secondAttribute="bottom" constant="8" symbolic="YES" type="default" id="S9w-hC-r7E"/>
<constraint firstItem="Qlx-ZC-Frh" firstAttribute="leading" secondItem="5gt-3Z-EX7" secondAttribute="leading" constant="20" symbolic="YES" type="default" id="Szt-Hn-q8P"/>
<constraint firstAttribute="trailing" secondItem="Qlx-ZC-Frh" secondAttribute="trailing" constant="20" symbolic="YES" type="default" id="XWw-YY-GVe"/>
<constraint firstItem="SL5-De-b5W" firstAttribute="baseline" secondItem="u94-gZ-jA3" secondAttribute="baseline" type="default" id="eHS-oI-aLh"/>
<constraint firstAttribute="trailing" secondItem="cGx-tv-t1S" secondAttribute="trailing" constant="20" symbolic="YES" type="default" id="wOk-3m-4Y0"/>
<constraint firstItem="0Oo-XX-FKf" firstAttribute="top" secondItem="5gt-3Z-EX7" secondAttribute="top" constant="140" id="wz3-hu-zOw"/>
</constraints>
</view>
<connections>
<outlet property="answerButton" destination="Y0w-gT-7xt" id="hsI-rg-FOd"/>
<outlet property="buddyID" destination="sUx-85-Rj8" id="5UU-5u-5vo"/>
<outlet property="call" destination="cGx-tv-t1S" id="30b-Dd-s2R"/>
<outlet property="message" destination="u94-gZ-jA3" id="2XV-cx-W6X"/>
<outlet property="numberL" destination="gDt-7s-ZPN" id="EK5-lw-biS"/>
<outlet property="tableView" destination="Qlx-ZC-Frh" id="hcJ-V0-R0p"/>
</connections>
</viewController>
<placeholder placeholderIdentifier="IBFirstResponder" id="FoB-n0-968" userLabel="First Responder" sceneMemberID="firstResponder"/>
</objects>
<point key="canvasLocation" x="624" y="-738"/>
</scene>
<!--Table View Controller-->
<scene sceneID="62K-F4-gCO">
<objects>
<tableViewController id="ygO-26-SDo" sceneMemberID="viewController">
<tableView key="view" opaque="NO" clipsSubviews="YES" clearsContextBeforeDrawing="NO" contentMode="scaleToFill" alwaysBounceVertical="YES" dataMode="prototypes" style="plain" rowHeight="44" sectionHeaderHeight="22" sectionFooterHeight="22" id="sbW-7b-suT">
<rect key="frame" x="0.0" y="20" width="320" height="460"/>
<autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
<color key="backgroundColor" white="1" alpha="1" colorSpace="calibratedWhite"/>
<prototypes>
<tableViewCell contentMode="scaleToFill" selectionStyle="blue" hidesAccessoryWhenEditing="NO" indentationLevel="1" indentationWidth="0.0" reuseIdentifier="FriendCell" id="X73-pA-kgk">
<rect key="frame" x="0.0" y="22" width="320" height="44"/>
<autoresizingMask key="autoresizingMask"/>
<view key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center">
<rect key="frame" x="0.0" y="0.0" width="320" height="43"/>
<autoresizingMask key="autoresizingMask"/>
<color key="backgroundColor" white="0.0" alpha="0.0" colorSpace="calibratedWhite"/>
</view>
</tableViewCell>
</prototypes>
<connections>
<outlet property="dataSource" destination="ygO-26-SDo" id="nNh-VO-gDg"/>
<outlet property="delegate" destination="ygO-26-SDo" id="oNu-6O-FGq"/>
</connections>
</tableView>
<navigationItem key="navigationItem" id="ZPA-fO-Y0f"/>
</tableViewController>
<placeholder placeholderIdentifier="IBFirstResponder" id="crH-4t-1HB" userLabel="First Responder" sceneMemberID="firstResponder"/>
</objects>
<point key="canvasLocation" x="766" y="144"/>
</scene>
</scenes>
<resources>
<image name="fb.png" width="300" height="65"/>
</resources>

<classes>
<class className="MainPage" superclassName="UIViewController">
<source key="sourceIdentifier" type="project" relativePath="./Classes/MainPage.h"/>
<relationships>
<relationship kind="action" name="addBuddy:"/>
<relationship kind="action" name="answerPressed:"/>

<relationship kind="action" name="call:"/>

<relationship kind="action" name="callNumber:"/>
<relationship kind="action" name="refreshBuddies:"/>
<relationship kind="action" name="sendMessage:"/>
<relationship kind="outlet" name="answerButton" candidateClass="UIButton"/>
<relationship kind="outlet" name="buddyID" candidateClass="UITextField"/>
<relationship kind="outlet" name="call" candidateClass="UIButton"/>
<relationship kind="outlet" name="message" candidateClass="UITextField"/>
<relationship kind="outlet" name="name" candidateClass="UILabel"/>
<relationship kind="outlet" name="numberL" candidateClass="UITextField"/>
<relationship kind="outlet" name="tableView" candidateClass="UITableView"/>
</relationships>
</class>
<class className="NSLayoutConstraint" superclassName="NSObject">
<source key="sourceIdentifier" type="project" relativePath="./Classes/NSLayoutConstraint.h"/>
</class>
<class className="ViewController" superclassName="UIViewController">
<source key="sourceIdentifier" type="project" relativePath="./Classes/ViewController.h"/>
<relationships>
<relationship kind="action" name="callUser:"/>
<relationship kind="action" name="dialNumber:"/>
<relationship kind="action" name="fbLogin:"/>
<relationship kind="outlet" name="answerButton" candidateClass="UIButton"/>
<relationship kind="outlet" name="callButton" candidateClass="UIButton"/>
<relationship kind="outlet" name="callUser" candidateClass="UITextField"/>
<relationship kind="outlet" name="dialNumberButton" candidateClass="UIButton"/>
<relationship kind="outlet" name="loginButton" candidateClass="UIButton"/>
<relationship kind="outlet" name="numberField" candidateClass="UITextField"/>
<relationship kind="outlet" name="rejectButton" candidateClass="UIButton"/>
<relationship kind="outlet" name="statusLabel" candidateClass="UILabel"/>
<relationship kind="outlet" name="table" candidateClass="UITableView"/>

<relationship kind="outlet" name="testLabel" candidateClass="UILabel"/>

</relationships>
</class>
</classes>

<simulatedMetricsContainer key="defaultSimulatedMetrics">
<simulatedStatusBarMetrics key="statusBar"/>
<simulatedOrientationMetrics key="orientation"/>
<simulatedScreenMetrics key="destination" type="retina4"/>
</simulatedMetricsContainer>
</document>