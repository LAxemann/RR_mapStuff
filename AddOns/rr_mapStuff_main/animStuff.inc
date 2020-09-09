/* Anim stuff */
class CfgMovesBasic {
	class default;
	class DefaultDie;
	class ManActions{
		RR_gesture_mapStuffEmpty[]= {
			"RR_gesture_mapStuffEmpty",
			"gesture"
		};
		RR_gesture_holdMapStand[]= {
			"RR_gesture_holdMapStand",
			"gesture"
		};
		RR_gesture_transitionToMapStand[]= {
			"RR_gesture_transitionToMapStand",
			"gesture"
		};
		RR_gesture_holdMapProne[]= {
			"RR_gesture_holdMapProne",
			"gesture"
		};
	};
};

class CfgGesturesMale {
	class default;
	class BlendAnims {
		//handsWeapon[] = {"head",1,"neck1",1,"neck",1,"weapon",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",1,"Spine1",1,"Spine2",1,"Spine3",1,"pelvis","MaskStart"};
		rrMapHolding[] = {"weapon",1,"LeftArm",1,"LeftArmRoll",1,"LeftShoulder",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightShoulder",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine",1,"pelvis","MaskStart"};
	};
	class States {
		class RR_gesture_mapStuffEmpty: default {
			file="";
			looped=0;
			speed=9.9;
			//mask="handsWeapon";
			mask="rrMapHolding";
			canPullTrigger=1;
			headBobMode=2;
			canReload=0;
			terminal=0;
			preload=1;
			disableWeapons=0;
			disableWeaponsLong=0;
			enableBinocular = 0;
			enableMissile = 0;
			onLadder = 0;
			showHandGun = 0;
			showWeaponAim = 0;
			showItemInHand = 1;
			showItemInRightHand = 0;
			headBobStrength=0.2;
			rightHandIKCurve[]={1};
			leftHandIKCurve[]={1};
		};
		class RR_gesture_holdMapStand: default {
			file="LAxemann\RR_mapStuff\addons\RR_mapStuff_main\anims\mapStandTest.rtm";
			looped=1;
			speed=-5;
			mask="rrMapHolding";
			canPullTrigger=0;
			headBobMode=2;
			canReload=0;
			terminal=0;
			preload=1;
			disableWeapons=1;
			disableWeaponsLong=1;
			enableBinocular = 0;
			enableMissile = 0;
			onLadder = 0;
			showHandGun = 0;
			showWeaponAim = 0;
			showItemInHand = 1;
			showItemInRightHand = 0;
			headBobStrength=0.2;
			rightHandIKCurve[]={0};
			leftHandIKCurve[]={0};
		};
		class RR_gesture_transitionToMapStand: RR_gesture_holdMapStand {
			file="LAxemann\RR_mapStuff\addons\RR_mapStuff_main\anims\mapStandTestTransition.rtm";
			looped=0;
			speed=-0.6666;
			connectTo[] = {"RR_gesture_holdMapStand", 1};
			interpolateTo[] = {"RR_gesture_holdMapStand", 1};
			rightHandIKCurve[]={
				0.0,1,
				0.4,1,
				0.5,0
			};
		};
		class RR_gesture_holdMapProne: RR_gesture_holdMapStand {
			file="LAxemann\RR_mapStuff\addons\RR_mapStuff_main\anims\mapProneTest.rtm";
		};
	};
};
