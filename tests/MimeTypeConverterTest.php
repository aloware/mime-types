<?php

use Magyarjeti\MimeTypes\MimeTypeConverter;
use PHPUnit\Framework\TestCase;

class MimeTypeConverterTest extends TestCase
{
    protected $converter;

    protected function setUp(): void
    {
        $this->converter = new MimeTypeConverter;
    }

    public function testConvertExtensionToMimeType()
    {
        $mime_type = $this->converter->toMimeType('jpg');

        $this->assertEquals('image/jpeg', $mime_type);
    }

    public function testConvertMimeTypeToExtension()
    {
        $extension = $this->converter->toExtension('image/jpeg');

        $this->assertContains($extension, ['jpg', 'jpeg']);
    }

    public function testConvertInvalidMimeType()
    {
        $this->assertNull($this->converter->toExtension('foo/bar'));
    }

    public function testConvertInvalidExtension()
    {
        $this->assertNull($this->converter->toMimeType('foobar'));
    }
}
