/*
 * Copyright (C) 2025 Mobile Porting Team
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

package mobile.objects;

import openfl.display.BitmapData;
import openfl.display.Shape;
import flixel.graphics.FlxGraphic;
import flixel.util.FlxSignal.FlxTypedSignal;
import openfl.geom.Matrix;
import states.PlayState;

/**
 * A zone with 4 hint's (A hitbox).
 * It's really easy to customize the layout.
 *
 * @author: Karim Akra and Lily Ross (mcagabe19)
 */
class Hitbox extends MobileInputManager implements IMobileControls
{
	final offsetFir:Int = (ClientPrefs.data.hitboxPos ? Std.int(FlxG.height / 4) * 3 : 0);
	final offsetSec:Int = (ClientPrefs.data.hitboxPos ? 0 : Std.int(FlxG.height / 4));

	public var buttonLeft:TouchButton = new TouchButton(0, 0, [MobileInputID.HITBOX_LEFT, MobileInputID.NOTE_LEFT]);
	public var buttonDown:TouchButton = new TouchButton(0, 0, [MobileInputID.HITBOX_DOWN, MobileInputID.NOTE_DOWN]);
	public var buttonUp:TouchButton = new TouchButton(0, 0, [MobileInputID.HITBOX_UP, MobileInputID.NOTE_UP]);
	public var buttonRight:TouchButton = new TouchButton(0, 0, [MobileInputID.HITBOX_RIGHT, MobileInputID.NOTE_RIGHT]);
	public var buttonExtra:TouchButton = new TouchButton(0, 0, [MobileInputID.EXTRA_1]);
	public var buttonExtra2:TouchButton = new TouchButton(0, 0, [MobileInputID.EXTRA_2]);
	
	//more
	public var button6K0:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_6K0]);
	public var button6K1:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_6K1]);
	public var button6K2:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_6K2]);
	public var button7Kspace:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_7KSPACE]);
	public var button6K3:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_6K3]);
	public var button6K4:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_6K4]);
	public var button6K5:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_6K5]);
	
	public var button9K0:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_9K0]);
	public var button9K1:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_9K1]);
	public var button9K2:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_9K2]);
	public var button9K3:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_9K3]);
	public var button9K4:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_9K4]);
	public var button9K5:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_9K5]);
	public var button9K6:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_9K6]);
	public var button9K7:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_9K7]);
	public var button9K8:TouchButton = new TouchButton(0, 0, [MobileInputID.NOTE_9K8]);

	public var instance:MobileInputManager;
	public var onButtonDown:FlxTypedSignal<TouchButton->Void> = new FlxTypedSignal<TouchButton->Void>();
	public var onButtonUp:FlxTypedSignal<TouchButton->Void> = new FlxTypedSignal<TouchButton->Void>();

	var storedButtonsIDs:Map<String, Array<MobileInputID>> = new Map<String, Array<MobileInputID>>();

	/**
	 * Create the zone.
	 */
	public function new(?extraMode:ExtraActions = NONE)
	{
		super();

		for (button in Reflect.fields(this))
		{
			var field = Reflect.field(this, button);
			if (Std.isOfType(field, TouchButton))
				storedButtonsIDs.set(button, Reflect.getProperty(field, 'IDs'));
		}

		switch (extraMode)
		{
			case NONE:
                if(PlayState.qqqeb6K)
				{
			    add(button6K0 = createHint(0, 0, Std.int(FlxG.width / 6), Std.int(FlxG.height * 1), 0xffE390E6));
				add(button6K1 = createHint(FlxG.width / 6 * 1, 0, Std.int(FlxG.width / 6), Std.int(FlxG.height * 1), 0xff00FF00));
				add(button6K2 = createHint(FlxG.width / 6 * 2, 0, Std.int(FlxG.width / 6), Std.int(FlxG.height * 1), 0xffFF0000));
				add(button6K3 = createHint(FlxG.width / 6 * 3, 0, Std.int(FlxG.width / 6), Std.int(FlxG.height * 1), 0xffFFFF00));
				add(button6K4 = createHint(FlxG.width / 6 * 4, 0, Std.int(FlxG.width / 6), Std.int(FlxG.height * 1), 0xff00EDFF));
	            add(button6K5 = createHint(FlxG.width / 6 * 5, 0, Std.int(FlxG.width / 6), Std.int(FlxG.height * 1), 0xff0000FF));
				}
				else if(PlayState.qqqeb7K)
				{
			    add(button6K0 = createHint(0, 0, Std.int(FlxG.width / 7), Std.int(FlxG.height * 1), 0xffE390E6));
				add(button6K1 = createHint(FlxG.width / 7 * 1, 0, Std.int(FlxG.width / 7), Std.int(FlxG.height * 1), 0xff00FF00));
				add(button6K2 = createHint(FlxG.width / 7 * 2, 0, Std.int(FlxG.width / 7), Std.int(FlxG.height * 1), 0xffFF0000));
				add(button7Kspace = createHint(FlxG.width / 7 * 3, 0, Std.int(FlxG.width / 7), Std.int(FlxG.height * 1), 0xffFFFFFF));
				add(button6K3 = createHint(FlxG.width / 7 * 4, 0, Std.int(FlxG.width / 7), Std.int(FlxG.height * 1), 0xffFFFF00));
				add(button6K4 = createHint(FlxG.width / 7 * 5, 0, Std.int(FlxG.width / 7), Std.int(FlxG.height * 1), 0xff00EDFF));
	            add(button6K5 = createHint(FlxG.width / 7 * 6, 0, Std.int(FlxG.width / 7), Std.int(FlxG.height * 1), 0xff0000FF));
				}
				else if(PlayState.qqqeb9K)
				{
			    add(button9K0 = createHint(0, 0, Std.int(FlxG.width / 9), Std.int(FlxG.height * 1), 0xffE390E6));
				add(button9K1 = createHint(FlxG.width / 9 * 1, 0, Std.int(FlxG.width / 9), Std.int(FlxG.height * 1), 0xff00EDFF));
				add(button9K2 = createHint(FlxG.width / 9 * 2, 0, Std.int(FlxG.width / 9), Std.int(FlxG.height * 1), 0xff00FF00));
				add(button9K3 = createHint(FlxG.width / 9 * 3, 0, Std.int(FlxG.width / 9), Std.int(FlxG.height * 1), 0xffFF0000));
				add(button9K4 = createHint(FlxG.width / 9 * 4, 0, Std.int(FlxG.width / 9), Std.int(FlxG.height * 1), 0xffFFFFFF));
				add(button9K5 = createHint(FlxG.width / 9 * 5, 0, Std.int(FlxG.width / 9), Std.int(FlxG.height * 1), 0xffFFFF00));
	            add(button9K6 = createHint(FlxG.width / 9 * 6, 0, Std.int(FlxG.width / 9), Std.int(FlxG.height * 1), 0xffBB00FF));
	            add(button9K7 = createHint(FlxG.width / 9 * 7, 0, Std.int(FlxG.width / 9), Std.int(FlxG.height * 1), 0xffFF0000));
	            add(button9K8 = createHint(FlxG.width / 9 * 8, 0, Std.int(FlxG.width / 9), Std.int(FlxG.height * 1), 0xff0000FF));
				}
				else
				{
				add(buttonLeft = createHint(0, 0, Std.int(FlxG.width / 4), FlxG.height, 0xFFC24B99));
				add(buttonDown = createHint(FlxG.width / 4, 0, Std.int(FlxG.width / 4), FlxG.height, 0xFF00FFFF));
				add(buttonUp = createHint(FlxG.width / 2, 0, Std.int(FlxG.width / 4), FlxG.height, 0xFF12FA05));
				add(buttonRight = createHint((FlxG.width / 2) + (FlxG.width / 4), 0, Std.int(FlxG.width / 4), FlxG.height, 0xFFF9393F));
				}
			case SINGLE:
				add(buttonLeft = createHint(0, offsetSec, Std.int(FlxG.width / 4), Std.int(FlxG.height / 4) * 3, 0xFFC24B99));
				add(buttonDown = createHint(FlxG.width / 4, offsetSec, Std.int(FlxG.width / 4), Std.int(FlxG.height / 4) * 3, 0xFF00FFFF));
				add(buttonUp = createHint(FlxG.width / 2, offsetSec, Std.int(FlxG.width / 4), Std.int(FlxG.height / 4) * 3, 0xFF12FA05));
				add(buttonRight = createHint((FlxG.width / 2) + (FlxG.width / 4), offsetSec, Std.int(FlxG.width / 4), Std.int(FlxG.height / 4) * 3,
					0xFFF9393F));
				add(buttonExtra = createHint(0, offsetFir, FlxG.width, Std.int(FlxG.height / 4), 0xFF0066FF));
			case DOUBLE:
				add(buttonLeft = createHint(0, offsetSec, Std.int(FlxG.width / 4), Std.int(FlxG.height / 4) * 3, 0xFFC24B99));
				add(buttonDown = createHint(FlxG.width / 4, offsetSec, Std.int(FlxG.width / 4), Std.int(FlxG.height / 4) * 3, 0xFF00FFFF));
				add(buttonUp = createHint(FlxG.width / 2, offsetSec, Std.int(FlxG.width / 4), Std.int(FlxG.height / 4) * 3, 0xFF12FA05));
				add(buttonRight = createHint((FlxG.width / 2) + (FlxG.width / 4), offsetSec, Std.int(FlxG.width / 4), Std.int(FlxG.height / 4) * 3,
					0xFFF9393F));
				add(buttonExtra2 = createHint(Std.int(FlxG.width / 2), offsetFir, Std.int(FlxG.width / 2), Std.int(FlxG.height / 4), 0xA6FF00));
				add(buttonExtra = createHint(0, offsetFir, Std.int(FlxG.width / 2), Std.int(FlxG.height / 4), 0xFF0066FF));
		}

		for (button in Reflect.fields(this))
		{
			if (Std.isOfType(Reflect.field(this, button), TouchButton))
				Reflect.setProperty(Reflect.getProperty(this, button), 'IDs', storedButtonsIDs.get(button));
		}

		storedButtonsIDs.clear();
		scrollFactor.set();
		updateTrackedButtons();

		instance = this;
	}

	/**
	 * Clean up memory.
	 */
	override function destroy()
	{
		super.destroy();
		onButtonUp.destroy();
		onButtonDown.destroy();

		for (fieldName in Reflect.fields(this))
		{
			var field = Reflect.field(this, fieldName);
			if (Std.isOfType(field, TouchButton))
				Reflect.setField(this, fieldName, FlxDestroyUtil.destroy(field));
		}
	}

	private function createHint(X:Float, Y:Float, Width:Int, Height:Int, Color:Int = 0xFFFFFF):TouchButton
	{
		var hint = new TouchButton(X, Y);
		hint.statusAlphas = [];
		hint.statusIndicatorType = NONE;
		hint.loadGraphic(createHintGraphic(Width, Height));

		hint.label = new FlxSprite();
		hint.labelStatusDiff = (ClientPrefs.data.hitboxType != "Hidden") ? ClientPrefs.data.controlsAlpha : 0.00001;
		hint.label.loadGraphic(createHintGraphic(Width, Math.floor(Height * 0.035), true));
		if (ClientPrefs.data.hitboxPos)
			hint.label.offset.y -= (hint.height - hint.label.height) / 2;
		else
			hint.label.offset.y += (hint.height - hint.label.height) / 2;

		if (ClientPrefs.data.hitboxType != "Hidden")
		{
			var hintTween:FlxTween = null;
			var hintLaneTween:FlxTween = null;

			hint.onDown.callback = function()
			{
				onButtonDown.dispatch(hint);

				if (hintTween != null)
					hintTween.cancel();

				if (hintLaneTween != null)
					hintLaneTween.cancel();

				hintTween = FlxTween.tween(hint, {alpha: ClientPrefs.data.controlsAlpha}, ClientPrefs.data.controlsAlpha / 100, {
					ease: FlxEase.circInOut,
					onComplete: (twn:FlxTween) -> hintTween = null
				});

				hintLaneTween = FlxTween.tween(hint.label, {alpha: 0.00001}, ClientPrefs.data.controlsAlpha / 10, {
					ease: FlxEase.circInOut,
					onComplete: (twn:FlxTween) -> hintTween = null
				});
			}

			hint.onOut.callback = hint.onUp.callback = function()
			{
				onButtonUp.dispatch(hint);

				if (hintTween != null)
					hintTween.cancel();

				if (hintLaneTween != null)
					hintLaneTween.cancel();

				hintTween = FlxTween.tween(hint, {alpha: 0.00001}, ClientPrefs.data.controlsAlpha / 10, {
					ease: FlxEase.circInOut,
					onComplete: (twn:FlxTween) -> hintTween = null
				});

				hintLaneTween = FlxTween.tween(hint.label, {alpha: ClientPrefs.data.controlsAlpha}, ClientPrefs.data.controlsAlpha / 100, {
					ease: FlxEase.circInOut,
					onComplete: (twn:FlxTween) -> hintTween = null
				});
			}
		}
		else
		{
			hint.onDown.callback = () -> onButtonDown.dispatch(hint);
			hint.onOut.callback = hint.onUp.callback = () -> onButtonUp.dispatch(hint);
		}

		hint.immovable = hint.multiTouch = true;
		hint.solid = hint.moves = false;
		hint.alpha = 0.00001;
		hint.label.alpha = (ClientPrefs.data.hitboxType != "Hidden") ? ClientPrefs.data.controlsAlpha : 0.00001;
		hint.canChangeLabelAlpha = false;
		hint.label.antialiasing = hint.antialiasing = ClientPrefs.data.antialiasing;
		hint.color = Color;
		#if FLX_DEBUG
		hint.ignoreDrawDebug = true;
		#end
		return hint;
	}

	function createHintGraphic(Width:Int, Height:Int, ?isLane:Bool = false):FlxGraphic
	{
		var shape:Shape = new Shape();
		shape.graphics.beginFill(0xFFFFFF);

		if (ClientPrefs.data.hitboxType == "No Gradient")
		{
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(Width, Height, 0, 0, 0);

			if (isLane)
				shape.graphics.beginFill(0xFFFFFF);
			else
				shape.graphics.beginGradientFill(RADIAL, [0xFFFFFF, 0xFFFFFF], [0, 1], [60, 255], matrix, PAD, RGB, 0);
			shape.graphics.drawRect(0, 0, Width, Height);
			shape.graphics.endFill();
		}
		else if (ClientPrefs.data.hitboxType == "No Gradient (Old)")
		{
			shape.graphics.lineStyle(10, 0xFFFFFF, 1);
			shape.graphics.drawRect(0, 0, Width, Height);
			shape.graphics.endFill();
		}
		else // if (ClientPrefs.data.hitboxType == 'Gradient')
		{
			shape.graphics.lineStyle(3, 0xFFFFFF, 1);
			shape.graphics.drawRect(0, 0, Width, Height);
			shape.graphics.lineStyle(0, 0, 0);
			shape.graphics.drawRect(3, 3, Width - 6, Height - 6);
			shape.graphics.endFill();
			if (isLane)
				shape.graphics.beginFill(0xFFFFFF);
			else
				shape.graphics.beginGradientFill(RADIAL, [0xFFFFFF, FlxColor.TRANSPARENT], [1, 0], [0, 255], null, null, null, 0.5);
			shape.graphics.drawRect(3, 3, Width - 6, Height - 6);
			shape.graphics.endFill();
		}

		var bitmap:BitmapData = new BitmapData(Width, Height, true, 0);
		bitmap.draw(shape);

		return FlxG.bitmap.add(bitmap);
	}
}
