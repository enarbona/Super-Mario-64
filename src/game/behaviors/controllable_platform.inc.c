// controllable_platform.c.inc

static s8 D_80331694 = 0;

void func_802F3BD8(void) {
    o->oParentRelativePosY -= 4.0f;
    if (o->oParentRelativePosY < 41.0f) {
        o->oParentRelativePosY = 41.0f;
        o->oAction = 2;
    }
}

void func_802F3C50(void) {
    if (o->oBehParams2ndByte == D_80331694)
        return;

    o->oParentRelativePosY += 4.0f;
    if (o->oParentRelativePosY > 51.0f) {
        o->oParentRelativePosY = 51.0f;
        o->oAction = 0;
    }
}

void bhv_controllable_platform_sub_loop(void) {
    switch (o->oAction) {
        case 0:
            if (o->oTimer < 30)
                break;
            
            if (gMarioObject->platform == o) {
                D_80331694 = o->oBehParams2ndByte;
                o->oAction = 1;
                PlaySound2(SOUND_GENERAL_SWITCH3);
            }
            break;

        case 1:
            func_802F3BD8();
            break;

        case 2:
            func_802F3C50();
            break;
    }

    o->oVelX = o->parentObj->oVelX;
    o->oVelZ = o->parentObj->oVelZ;

    if (o->parentObj->activeFlags == 0)
        o->activeFlags = 0;
}

void bhv_controllable_platform_init(void) {
    struct Object *sp34;
    sp34 = spawn_object_rel_with_rot(o, MODEL_HMC_METAL_ARROW_PLATFORM, bhvControllablePlatformSub, 0, 51, 204, 0, 0, 0);
    sp34->oBehParams2ndByte = 1;
    sp34 = spawn_object_rel_with_rot(o, MODEL_HMC_METAL_ARROW_PLATFORM, bhvControllablePlatformSub, 0, 51, -204, 0, -0x8000, 0);
    sp34->oBehParams2ndByte = 2;
    sp34 = spawn_object_rel_with_rot(o, MODEL_HMC_METAL_ARROW_PLATFORM, bhvControllablePlatformSub, 204, 51, 0, 0, 0x4000, 0);
    sp34->oBehParams2ndByte = 3;
    sp34 = spawn_object_rel_with_rot(o, MODEL_HMC_METAL_ARROW_PLATFORM, bhvControllablePlatformSub, -204, 51, 0, 0, -0x4000, 0);
    sp34->oBehParams2ndByte = 4;

    D_80331694 = 0;

    o->oControllablePlatformUnkFC = o->oPosY;
}

void func_802F3F80(s8 sp1B) {
    o->oUnknownUnkF8_S32 = sp1B;
    o->oTimer = 0;
    D_80331694 = 5;

    PlaySound2(SOUND_GENERAL_QUIETPOUND1);
}

void func_802F3FD8(s8 sp1B, s8 sp1C[3], Vec3f sp20, UNUSED Vec3f sp24, Vec3f sp28) {
    if (sp1C[1] == 1 || (sp1C[0] == 1 && sp1C[2] == 1))
        func_802F3F80(sp1B);
    else {
        if (sp1C[0] == 1) {
            if (((sp1B == 1 || sp1B == 2) && (s32)sp20[2] != 0) 
                || ((sp1B == 3 || sp1B == 4) && (s32)sp20[0] != 0)) {
                func_802F3F80(sp1B);    
            }
            else {
                o->oPosX += sp20[0];
                o->oPosZ += sp20[2];
            }
        } 
            
        if (sp1C[2] == 1) {
            if (((sp1B == 1 || sp1B == 2) && (s32)sp28[2] != 0) 
                || ((sp1B == 3 || sp1B == 4) && (s32)sp28[0] != 0)) {
                func_802F3F80(sp1B);    
            }
            else {
                o->oPosX += sp28[0];
                o->oPosZ += sp28[2];
            }
        }
    }

    if (!IsPointCloseToMario(o->oPosX, o->oPosY, o->oPosZ, 400)) {
        D_80331694 = 6;
        o->oUnknownUnk100_S32 = 1;
        o->oTimer = 0;
    }
}

void func_802F4230(void) {
    if (o->oUnknownUnkF8_S32 == 1 || o->oUnknownUnkF8_S32 == 2) {
        o->oFaceAnglePitch = sins(o->oTimer * 0x1000) * 182.04444 * 10.0;
        o->oPosY = o->oUnknownUnkFC_F32 + sins(o->oTimer * 0x2000) * 20.0f;
    }
    else {
        o->oFaceAngleRoll = sins(o->oTimer * 0x1000) * 182.04444 * 10.0;
        o->oPosY = o->oUnknownUnkFC_F32 + sins(o->oTimer * 0x2000) * 20.0f;
    } 
        
    if (o->oTimer == 32) {
        D_80331694 = o->oUnknownUnkF8_S32;
        o->oFaceAnglePitch = 0;
        o->oFaceAngleRoll = 0;
        o->oPosY = o->oUnknownUnkFC_F32;
    }
}

void func_802F43EC(void) {
    s16 sp1E = gMarioObject->header.gfx.pos[0] - o->oPosX;
    s16 sp1C = gMarioObject->header.gfx.pos[2] - o->oPosZ;

    if (gMarioObject->platform == o || gMarioObject->platform 
            == obj_nearest_object_with_behavior(bhvControllablePlatformSub)) {
        o->oFaceAnglePitch = sp1C * 4;
        o->oFaceAngleRoll = -sp1E * 4;
        if (D_80331694 == 6) {
            D_80331694 = 0;
            o->oTimer = 0;
            o->header.gfx.node.flags &= ~0x10;
        }
    }
    else { }
}

void bhv_controllable_platform_loop(void) {
    s8 sp54[3];
    Vec3f sp48;
    Vec3f sp3C;
    Vec3f sp30;

    o->oAngleVelRoll = 0;
    o->oAngleVelPitch = 0;
    o->oVelX = 0;
    o->oVelZ = 0;
    
    switch (D_80331694) {
        case 0:
            o->oFaceAnglePitch /= 2;
            o->oFaceAngleRoll /= 2;
            if (o->oControllablePlatformUnk100 == 1 && o->oTimer > 30) {
                D_80331694 = 6;
                o->oTimer = 0;
            }
            break;

        case 1:
            o->oVelZ = 10.0f;
            sp54[0] = func_802E478C(sp48, o->oPosX + 250.0, o->oPosY, o->oPosZ + 300.0, 50.0f);
            sp54[1] = func_802E478C(sp3C, o->oPosX, o->oPosY, o->oPosZ + 300.0, 50.0f);
            sp54[2] = func_802E478C(sp30, o->oPosX - 250.0, o->oPosY, o->oPosZ + 300.0, 50.0f);
            func_802F3FD8(2, sp54, sp48, sp3C, sp30);
            break;

        case 2:            
            o->oVelZ = -10.0f;
            sp54[0] = func_802E478C(sp48, o->oPosX + 250.0, o->oPosY, o->oPosZ - 300.0, 50.0f);
            sp54[1] = func_802E478C(sp3C, o->oPosX, o->oPosY, o->oPosZ - 300.0, 50.0f);
            sp54[2] = func_802E478C(sp30, o->oPosX - 250.0, o->oPosY, o->oPosZ - 300.0, 50.0f);
            func_802F3FD8(1, sp54, sp48, sp3C, sp30);
            break;

        case 3:
            o->oVelX = 10.0f;
            sp54[0] = func_802E478C(sp48, o->oPosX + 300.0, o->oPosY, o->oPosZ + 250.0, 50.0f);
            sp54[1] = func_802E478C(sp3C, o->oPosX + 300.0, o->oPosY, o->oPosZ, 50.0f);
            sp54[2] = func_802E478C(sp30, o->oPosX + 300.0, o->oPosY, o->oPosZ - 250.0, 50.0f);
            func_802F3FD8(4, sp54, sp48, sp3C, sp30);
            break;

        case 4:            
            o->oVelX = -10.0f;
            sp54[0] = func_802E478C(sp48, o->oPosX - 300.0, o->oPosY, o->oPosZ + 250.0, 50.0f);
            sp54[1] = func_802E478C(sp3C, o->oPosX - 300.0, o->oPosY, o->oPosZ, 50.0f);
            sp54[2] = func_802E478C(sp30, o->oPosX - 300.0, o->oPosY, o->oPosZ - 250.0, 50.0f);
            func_802F3FD8(3, sp54, sp48, sp3C, sp30);
            break;

        case 5:
            func_802F4230();
            return;
            break;

        case 6:
            if (ObjFlickerAndDisappear(o, 150))
                spawn_object_abs_with_rot(o, 0, MODEL_HMC_METAL_PLATFORM, bhvControllablePlatform, o->oHomeX, o->oHomeY, o->oHomeZ, 0, 0, 0);
            break;
    }

    func_802F43EC();
    o->oPosX += o->oVelX;
    o->oPosZ += o->oVelZ;
    if (D_80331694 != 0 && D_80331694 != 6)
        PlaySound(SOUND_ENVIRONMENT_ELEVATOR2);
}