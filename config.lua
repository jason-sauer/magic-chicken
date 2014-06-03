--calculate the aspect ratio of the device:
local aspectRatio = display.pixelHeight / display.pixelWidth

application = {
    showRuntimeErrors = true,
    content = {
        graphicsCompatibility = 1,
        width = aspectRatio > 1.5 and 320 or math.ceil( 480 / aspectRatio ),
        height = aspectRatio < 1.5 and 480 or math.ceil( 320 * aspectRatio ),
        scale = "letterBox",
        fps = 30,

        imageSuffix = {
            ["@2x"] = 2
        },
    },
}